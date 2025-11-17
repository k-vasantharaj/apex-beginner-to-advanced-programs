/**
 * Class Name : AccountOpportunityMapper
 * Purpose    : Build a Map<AccountId, List<Opportunity>> for Closed Won/Lost Opportunities
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 * Version    : 1.0
 */

public class AccountOpportunityMapper {

    // Holds AccountId → List of related Opportunities
    public Map<Id, List<Opportunity>> oppWithAccountIdMap = new Map<Id, List<Opportunity>>();

    // Constructor - builds the map
    public AccountOpportunityMapper() {

        // Query Opportunities
        List<Opportunity> oppList = [
            SELECT Id, Name, AccountId, StageName
            FROM Opportunity
            WHERE StageName IN ('Closed Won', 'Closed Lost')
              AND AccountId != NULL
        ];

        // Build Map<AccountId, List<Opportunity>>
        for (Opportunity opp : oppList) {

            // If bucket doesn't exist, create it
            if (!oppWithAccountIdMap.containsKey(opp.AccountId)) {
                oppWithAccountIdMap.put(opp.AccountId, new List<Opportunity>());
            }

            // Add Opportunity to the corresponding Account's bucket
            oppWithAccountIdMap.get(opp.AccountId).add(opp);
        }
    }

    /**
     * Method Name : displayAccounts()
     * Purpose     : Query and display all accounts present in the map
     */
    public void displayAccounts() {

        // Fetch Account details for the keys in map
        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            WHERE Id IN :oppWithAccountIdMap.keySet()
        ];

        // Display results
        for (Account acc : accList) {
            System.debug('Account: ' + acc.Name);

            // Display related opportunities
            List<Opportunity> opps = oppWithAccountIdMap.get(acc.Id);

            if (opps != null && !opps.isEmpty()) {
                for (Opportunity opp : opps) {
                    System.debug('   → Opportunity: ' + opp.Name + 
                                 ' | Stage: ' + opp.StageName);
                }
            }
        }
    }
}
