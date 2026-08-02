import pytest
import uuid
from decimal import Decimal
from httpx import AsyncClient

from app.models.user import User
from app.models.household import Household
from app.models.household_member import HouseholdMember
from app.models.enums import HouseholdRole
from app.api.dependencies import get_current_user, get_db
import uuid
from app.models.user import User

@pytest.fixture
def mock_user():
    user = User(
        id=uuid.uuid4(),
        email="test@example.com",
        is_active=True
    )
    user.memberships = []
    return user

@pytest.fixture
def override_dependency(mock_user, db_session):
    async def override_get_db():
        yield db_session
        
    app.dependency_overrides[get_current_user] = lambda: mock_user
    app.dependency_overrides[get_db] = override_get_db
    yield
    app.dependency_overrides.clear()

from app.main import app
from httpx import ASGITransport

@pytest.fixture
async def async_client(override_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.fixture
async def setup_household(db_session):
    # Create user
    user = User(
        email=f"settlement_{uuid.uuid4()}@example.com",
        hashed_password="hashed_password",
        is_active=True,
    )
    db_session.add(user)
    
    # Create household
    household = Household(name="Settlement Household")
    db_session.add(household)
    await db_session.flush()
    
    # Add user to household
    member = HouseholdMember(user_id=user.id, household_id=household.id, role=HouseholdRole.OWNER)
    db_session.add(member)
    await db_session.commit()
    
    return user, household

@pytest.mark.asyncio
async def test_get_balances_empty(async_client: AsyncClient, setup_household, mock_user):
    user, household = setup_household
    mock_user.id = user.id
    mock_user.memberships = [HouseholdMember(household_id=household.id)]
    
    response = await async_client.get(f"/api/v1/households/{household.id}/balances")
    assert response.status_code == 200
    assert response.json() == []

@pytest.mark.asyncio
async def test_complete_settlement(async_client: AsyncClient, setup_household, mock_user):
    user, household = setup_household
    mock_user.id = user.id
    mock_user.memberships = [HouseholdMember(household_id=household.id)]
    
    payee_id = uuid.uuid4()
    
    payload = {
        "payer_id": str(user.id),
        "payee_id": str(payee_id),
        "amount": "50.00"
    }
    
    response = await async_client.post(f"/api/v1/settlements/complete?household_id={household.id}", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["amount"] == "50.00"
    assert data["status"] == "COMPLETED"

@pytest.mark.asyncio
async def test_get_ledger(async_client: AsyncClient, setup_household, mock_user):
    user, household = setup_household
    mock_user.id = user.id
    mock_user.memberships = [HouseholdMember(household_id=household.id)]
    
    response = await async_client.get(f"/api/v1/households/{household.id}/ledger")
    assert response.status_code == 200
    assert "entries" in response.json()
