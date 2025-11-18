public class OpportunityHierarchyService {

    public static void printOpportunityHierarchy() {
        // Query Opportunities with Owner and Owner's Manager details
        List<Opportunity> oppList = [
            SELECT Id,
                   Name,
                   Owner.Name,
                   Owner.Manager.Name
            FROM Opportunity
        ];

        for (Opportunity opp : oppList) {
            System.debug('Opportunity Id: ' + opp.Id);
            System.debug('Opportunity Name: ' + opp.Name);
            System.debug('Owner Name: ' + opp.Owner.Name);
            System.debug('Owner Manager Name: ' + opp.Owner.Manager.Name);
        }
    }
}

// Anonymous block execution
OpportunityHierarchyService.printOpportunityHierarchy();
