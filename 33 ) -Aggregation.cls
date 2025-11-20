public class OpportunityMaxAmountCalculator {

    public static void getMaxOpportunityAmountByAccount() {

        List<AggregateResult> aggregatedResults = [
            SELECT AccountId, MAX(Amount) maxAmount
            FROM Opportunity
            GROUP BY AccountId
        ];

        for (AggregateResult record : aggregatedResults) {
            Id accountId = (Id) record.get('AccountId');
            Decimal maxAmount = (Decimal) record.get('maxAmount');

            System.debug('AccountId: ' + accountId + ' | Max Amount: ' + maxAmount);
        }
    }
}
//Anonymous Apex Call
OpportunityMaxAmountCalculator.getMaxOpportunityAmountByAccount();
//Sample Debug Output
AccountId: 001XXXXXXXXXXXX | Max Amount: 75000
AccountId: 001YYYYYYYYYYYY | Max Amount: 120000
AccountId: 001ZZZZZZZZZZZZ | Max Amount: 45000                          
