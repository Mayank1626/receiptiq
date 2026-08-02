import pytest
import uuid
from decimal import Decimal
from httpx import AsyncClient

from app.models.enums import SplitType, SplitStatus, HouseholdRole
from app.models.receipt import Receipt
from app.models.user import User
from app.models.household import Household
from app.models.household_member import HouseholdMember
from app.repositories.receipt_repository import ReceiptRepository
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
async def setup_receipt(db_session):
    # Create user
    user = User(
        email=f"splituser_{uuid.uuid4()}@example.com",
        hashed_password="hashed_password",
        is_active=True,
    )
    db_session.add(user)
    
    # Create household
    household = Household(name="Split Household")
    db_session.add(household)
    await db_session.flush()
    
    # Add user to household
    member = HouseholdMember(user_id=user.id, household_id=household.id, role=HouseholdRole.OWNER)
    db_session.add(member)
    
    # Create receipt
    receipt = Receipt(
        owner_id=user.id,
        household_id=household.id,
        total_amount=Decimal("100.00"),
        file_path="dummy.jpg"
    )
    db_session.add(receipt)
    await db_session.commit()
    
    return receipt, user, household

@pytest.mark.asyncio
async def test_create_split_success(async_client: AsyncClient, setup_receipt, mock_user):
    receipt, user, household = setup_receipt
    # We use mock_user as current user in the API
    mock_user.id = user.id
    mock_user.memberships = [HouseholdMember(household_id=household.id)]
    
    user2_id = uuid.uuid4()
    
    payload = {
        "split_type": SplitType.EQUAL.value,
        "shares": [
            {
                "user_id": str(user.id),
                "amount_paid": "100.00",
                "amount_owed": "50.00"
            },
            {
                "user_id": str(user2_id),
                "amount_paid": "0.00",
                "amount_owed": "50.00"
            }
        ]
    }
    
    response = await async_client.post(f"/api/v1/receipts/{receipt.id}/split", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["split_type"] == SplitType.EQUAL.value
    assert data["status"] == SplitStatus.ACTIVE.value
    assert len(data["shares"]) == 2

@pytest.mark.asyncio
async def test_create_split_invalid_sum(async_client: AsyncClient, setup_receipt, mock_user):
    receipt, user, household = setup_receipt
    mock_user.id = user.id
    mock_user.memberships = [HouseholdMember(household_id=household.id)]
    
    user2_id = uuid.uuid4()
    
    payload = {
        "split_type": SplitType.EQUAL.value,
        "shares": [
            {
                "user_id": str(user.id),
                "amount_paid": "100.00",
                "amount_owed": "40.00"  # Sum is 90, not 100
            },
            {
                "user_id": str(user2_id),
                "amount_paid": "0.00",
                "amount_owed": "50.00"
            }
        ]
    }
    
    response = await async_client.post(f"/api/v1/receipts/{receipt.id}/split", json=payload)
    assert response.status_code == 400
    assert "Sum of shares" in response.json()["detail"]
