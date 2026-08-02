from decimal import Decimal
from typing import List, Dict
from uuid import UUID

from app.models.expense_split import ExpenseSplit
from app.models.settlement import Settlement
from app.models.enums import SplitStatus, SettlementStatus

class BalanceCalculator:
    """
    Pure algorithmic component to calculate net balances for users in a household.
    Positive balance means the user is owed money.
    Negative balance means the user owes money.
    """
    
    @staticmethod
    def calculate_balances(splits: List[ExpenseSplit], settlements: List[Settlement]) -> Dict[UUID, Decimal]:
        balances: Dict[UUID, Decimal] = {}
        
        # Process active splits
        for split in splits:
            if split.status != SplitStatus.ACTIVE:
                continue
                
            for share in split.shares:
                user_id = share.user_id
                if user_id not in balances:
                    balances[user_id] = Decimal("0.00")
                
                # Balance = Amount Paid - Amount Owed
                balances[user_id] += share.amount_paid
                balances[user_id] -= share.amount_owed

        # Process completed settlements
        for settlement in settlements:
            if settlement.status != SettlementStatus.COMPLETED:
                continue
                
            payer_id = settlement.payer_id
            payee_id = settlement.payee_id
            amount = settlement.amount
            
            if payer_id not in balances:
                balances[payer_id] = Decimal("0.00")
            if payee_id not in balances:
                balances[payee_id] = Decimal("0.00")
                
            # Payer gave money, so their balance goes up (they owe less / are owed more)
            balances[payer_id] += amount
            
            # Payee received money, so their balance goes down (they are owed less / owe more)
            balances[payee_id] -= amount
            
        return balances
