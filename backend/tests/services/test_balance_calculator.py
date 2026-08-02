import pytest
import uuid
from decimal import Decimal

from app.models.expense_split import ExpenseSplit
from app.models.expense_share import ExpenseShare
from app.models.settlement import Settlement
from app.models.enums import SplitStatus, SettlementStatus
from app.services.balance_calculator import BalanceCalculator

def test_balance_calculator_empty():
    balances = BalanceCalculator.calculate_balances([], [])
    assert balances == {}

def test_balance_calculator_single_split():
    user1 = uuid.uuid4()
    user2 = uuid.uuid4()
    
    # user1 paid 100, but they only owe 50. user2 owes 50.
    split = ExpenseSplit(status=SplitStatus.ACTIVE)
    share1 = ExpenseShare(user_id=user1, amount_paid=Decimal("100"), amount_owed=Decimal("50"))
    share2 = ExpenseShare(user_id=user2, amount_paid=Decimal("0"), amount_owed=Decimal("50"))
    split.shares = [share1, share2]
    
    balances = BalanceCalculator.calculate_balances([split], [])
    
    assert balances[user1] == Decimal("50.00")
    assert balances[user2] == Decimal("-50.00")

def test_balance_calculator_with_settlement():
    user1 = uuid.uuid4()
    user2 = uuid.uuid4()
    
    split = ExpenseSplit(status=SplitStatus.ACTIVE)
    share1 = ExpenseShare(user_id=user1, amount_paid=Decimal("100"), amount_owed=Decimal("50"))
    share2 = ExpenseShare(user_id=user2, amount_paid=Decimal("0"), amount_owed=Decimal("50"))
    split.shares = [share1, share2]
    
    # user2 pays user1 20
    settlement = Settlement(
        payer_id=user2,
        payee_id=user1,
        amount=Decimal("20.00"),
        status=SettlementStatus.COMPLETED
    )
    
    balances = BalanceCalculator.calculate_balances([split], [settlement])
    
    # user1 was owed 50, got 20, now owed 30.
    assert balances[user1] == Decimal("30.00")
    # user2 owed 50, paid 20, now owes 30.
    assert balances[user2] == Decimal("-30.00")

def test_balance_calculator_ignores_invalid_and_pending():
    user1 = uuid.uuid4()
    user2 = uuid.uuid4()
    
    # INVALID split should be ignored
    split = ExpenseSplit(status=SplitStatus.INVALID)
    share1 = ExpenseShare(user_id=user1, amount_paid=Decimal("100"), amount_owed=Decimal("50"))
    share2 = ExpenseShare(user_id=user2, amount_paid=Decimal("0"), amount_owed=Decimal("50"))
    split.shares = [share1, share2]
    
    # PENDING settlement should be ignored
    settlement = Settlement(
        payer_id=user2,
        payee_id=user1,
        amount=Decimal("50.00"),
        status=SettlementStatus.PENDING
    )
    
    balances = BalanceCalculator.calculate_balances([split], [settlement])
    assert balances == {}
