public class AccountOpportunityService {

    public static void printClosedWonOpps() {
        // Query all Accounts with only Closed Won Opportunities
        List<Account> accList = [
            SELECT Id, Name,
                   (SELECT StageName FROM Opportunities WHERE StageName = 'Closed Won')
            FROM Account
        ];

        for (Account acc : accList) {
            System.debug('Account: ' + acc.Name);

            List<Opportunity> oppList = acc.Opportunities;

            for (Opportunity opp : oppList) {
                System.debug('  Opportunity Stage: ' + opp.StageName);
            }
        }
    }
}

// Anonymous block execution
AccountOpportunityService.printClosedWonOpps();
