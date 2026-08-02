from decimal import Decimal
from typing import Dict, List
from uuid import UUID
from dataclasses import dataclass

@dataclass
class SuggestedSettlement:
    payer_id: UUID
    payee_id: UUID
    amount: Decimal

class SettlementOptimizer:
    """
    Pure algorithmic component to simplify debts using a greedy algorithm.
    """
    
    @staticmethod
    def optimize(balances: Dict[UUID, Decimal]) -> List[SuggestedSettlement]:
        # Filter out negligible balances (e.g. less than 1 cent due to float math, though Decimal prevents most of this)
        filtered_balances = {uid: bal for uid, bal in balances.items() if abs(bal) >= Decimal("0.01")}
        
        # Separate into creditors and debtors
        creditors = {uid: bal for uid, bal in filtered_balances.items() if bal > 0}
        debtors = {uid: -bal for uid, bal in filtered_balances.items() if bal < 0}
        
        suggested_settlements: List[SuggestedSettlement] = []
        
        while creditors and debtors:
            # Greedily match largest creditor with largest debtor
            max_creditor_id = max(creditors.items(), key=lambda x: x[1])[0]
            max_debtor_id = max(debtors.items(), key=lambda x: x[1])[0]
            
            creditor_amount = creditors[max_creditor_id]
            debtor_amount = debtors[max_debtor_id]
            
            settled_amount = min(creditor_amount, debtor_amount)
            
            suggested_settlements.append(
                SuggestedSettlement(
                    payer_id=max_debtor_id,
                    payee_id=max_creditor_id,
                    amount=settled_amount
                )
            )
            
            creditors[max_creditor_id] -= settled_amount
            debtors[max_debtor_id] -= settled_amount
            
            if creditors[max_creditor_id] < Decimal("0.01"):
                del creditors[max_creditor_id]
            if debtors[max_debtor_id] < Decimal("0.01"):
                del debtors[max_debtor_id]
                
        return suggested_settlements
