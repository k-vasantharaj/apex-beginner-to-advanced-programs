public class OpportunityAverageCalculator {

    public static void getAverageAmountByStage() {

        List<AggregateResult> aggregatedResults = [
            SELECT StageName, AVG(Amount) avgAmount
            FROM Opportunity
            GROUP BY StageName
        ];

        for (AggregateResult record : aggregatedResults) {
            String stageName = (String) record.get('StageName');
            Decimal avgAmount = (Decimal) record.get('avgAmount');

            System.debug('Stage Name: ' + stageName + ' | Average Amount: ' + avgAmount);
        }
    }
}
//Anonymous Apex Call
OpportunityAverageCalculator.getAverageAmountByStage();
// Sample Debug Output
Stage Name: Prospecting | Average Amount: 15000
Stage Name: Qualification | Average Amount: 22000
Stage Name: Proposal/Price Quote | Average Amount: 58000
Stage Name: Closed Won | Average Amount: 90000
