public class OpportunityAggregator {

    public static void calculateTotalAmountByAccount() {

        List<AggregateResult> aggregatedResults = [
            SELECT AccountId, SUM(Amount) totalAmount
            FROM Opportunity
            GROUP BY AccountId
        ];

        for (AggregateResult record : aggregatedResults) {
            Id accountId = (Id) record.get('AccountId');
            Decimal totalAmount = (Decimal) record.get('totalAmount');

            System.debug('AccountId: ' + accountId + ' | Total Amount: ' + totalAmount);
        }
    }
}
