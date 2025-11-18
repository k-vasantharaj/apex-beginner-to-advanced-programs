/**
 * Class Name : AccountsWithoutOpportunities
 * Purpose    : Retrieve Accounts that have no related Opportunities
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class AccountsWithoutOpportunities {

    public static void displayAccountsWithoutOpps() {

        // Query Accounts that do NOT have any Opportunities
        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            WHERE Id NOT IN (SELECT AccountId FROM Opportunity)
        ];

        System.debug('--- Accounts Without Opportunities ---');

        for (Account acc : accList) {
            System.debug('Account: ' + acc.Name);
        }
    }
}
//Anonymous Apex Execution
AccountsWithoutOpportunities.displayAccountsWithoutOpps();
