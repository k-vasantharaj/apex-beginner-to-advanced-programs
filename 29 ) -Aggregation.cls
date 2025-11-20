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

//Anonymous Apex Call
OpportunityRevenueAnalyzer.getTop5StagesByMaxRevenue();

//Sample Debug Output

Stage Name: Closed Won | Max Revenue: 500000
Stage Name: Proposal/Price Quote | Max Revenue: 300000
Stage Name: Negotiation/Review | Max Revenue: 250000
Stage Name: Qualification | Max Revenue: 180000
Stage Name: Prospecting | Max Revenue: 120000
