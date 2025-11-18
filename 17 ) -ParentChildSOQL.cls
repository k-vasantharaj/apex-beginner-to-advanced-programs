/**
 * Class Name : AccountWithHighValueOpps
 * Purpose    : Retrieve Accounts and their Opportunities where Opp Amount > 100000
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class AccountWithHighValueOpps {

    public static void displayAccountsWithHighOpps() {

        // Parent → Child SOQL query with filter on child records
        List<Account> accList = [
            SELECT Id, Name,
                   (SELECT Id, Name, Amount FROM Opportunities WHERE Amount > 100000)
            FROM Account
        ];

        System.debug('--- Accounts & High-Value Opportunities ---');

        for (Account acc : accList) {
            System.debug('Account: ' + acc.Name);

            // Child relationship list
            List<Opportunity> opps = acc.Opportunities;

            if (opps.isEmpty()) {
                System.debug('   → No Opportunities > 100000');
            } else {
                for (Opportunity opp : opps) {
                    System.debug(
                        '   → Opportunity: ' + opp.Name +
                        ' | Amount: ' + opp.Amount
                    );
                }
            }
        }
    }
}

//Anonymous Apex Execution
AccountWithHighValueOpps.displayAccountsWithHighOpps();
