public class OpportunityTodayQuery {

    public static void fetchTodaysOpportunities() {
        
        // Query all Opportunities created today
        List<Opportunity> opportunityList = [
            SELECT Id, Amount, CreatedDate
            FROM Opportunity
            WHERE CreatedDate = TODAY
        ];
        
        // Debug results
        for (Opportunity opp : opportunityList) {
            System.debug('Opportunity Amount: ' + opp.Amount);
        }
    }
}
