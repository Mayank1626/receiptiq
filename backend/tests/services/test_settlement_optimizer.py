import pytest
import uuid
from decimal import Decimal

from app.services.settlement_optimizer import SettlementOptimizer, SuggestedSettlement

def test_settlement_optimizer_empty():
    settlements = SettlementOptimizer.optimize({})
    assert settlements == []

def test_settlement_optimizer_balanced_pair():
    user1 = uuid.uuid4()
    user2 = uuid.uuid4()
    
    balances = {
        user1: Decimal("50.00"),
        user2: Decimal("-50.00")
    }
    
    settlements = SettlementOptimizer.optimize(balances)
    
    assert len(settlements) == 1
    assert settlements[0].payer_id == user2
    assert settlements[0].payee_id == user1
    assert settlements[0].amount == Decimal("50.00")

def test_settlement_optimizer_multiple_users():
    u_owed_big = uuid.uuid4()
    u_owed_small = uuid.uuid4()
    u_owes_big = uuid.uuid4()
    u_owes_small = uuid.uuid4()
    
    balances = {
        u_owed_big: Decimal("100.00"),
        u_owed_small: Decimal("20.00"),
        u_owes_big: Decimal("-90.00"),
        u_owes_small: Decimal("-30.00")
    }
    
    settlements = SettlementOptimizer.optimize(balances)
    
    # We should have exactly 3 settlements to clear 4 people's balances
    assert len(settlements) == 3
    
    # Verify the net effect of the settlements matches the balances
    verification_balances = {u: Decimal("0.00") for u in balances.keys()}
    for s in settlements:
        verification_balances[s.payer_id] -= s.amount
        verification_balances[s.payee_id] += s.amount
        
    for u, original_balance in balances.items():
        assert verification_balances[u] == original_balance

def test_settlement_optimizer_ignores_dust():
    user1 = uuid.uuid4()
    user2 = uuid.uuid4()
    
    balances = {
        user1: Decimal("0.005"),
        user2: Decimal("-0.005")
    }
    
    settlements = SettlementOptimizer.optimize(balances)
    assert len(settlements) == 0
