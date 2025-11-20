public class OpportunityRevenueAnalyzer {

    public static void getTop5StagesByMaxRevenue() {

        List<AggregateResult> aggregatedResults = [
            SELECT StageName, MAX(Amount) revenue
            FROM Opportunity
            GROUP BY StageName
            ORDER BY MAX(Amount) DESC
            LIMIT 5
        ];

        for (AggregateResult record : aggregatedResults) {
            String stageName = (String) record.get('StageName');
            Decimal revenue = (Decimal) record.get('revenue');

            System.debug('Stage Name: ' + stageName + ' | Max Revenue: ' + revenue);
        }
    }
}
