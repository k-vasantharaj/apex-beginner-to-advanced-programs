public class OpportunityAggregator {

    public static void getHighValueAccountTotals() {

        List<AggregateResult> aggregatedResults = [
            SELECT AccountId, SUM(Amount) totalAmount
            FROM Opportunity
            GROUP BY AccountId
            HAVING SUM(Amount) > 200000
        ];

        for (AggregateResult record : aggregatedResults) {
            Id accountId = (Id) record.get('AccountId');
            Decimal totalAmount = (Decimal) record.get('totalAmount');

            System.debug('AccountId: ' + accountId + ' | Total Amount: ' + totalAmount);
        }
    }
}
