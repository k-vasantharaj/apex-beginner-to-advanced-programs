public class AccountMonthlyFetcher {

    public static void getAccountsCreatedThisMonth() {
        // Fetch accounts created in the current calendar month
        List<Account> accList = [
            SELECT Id, Name, CreatedDate
            FROM Account
            WHERE CreatedDate = THIS_MONTH
        ];

        // Debug results
        for (Account acc : accList) {
            System.debug('Account: ' + acc.Name + 
                         ' | Created On: ' + acc.CreatedDate);
        }
    }
}
//Anonymous Apex 
AccountMonthlyFetcher.getAccountsCreatedThisMonth();
// Debug Result (Example Output)
Account: Acme Corp | Created On: 2025-11-03 10:22:15
Account: Global Tech | Created On: 2025-11-11 14:55:02
Account: MegaSoft Pvt Ltd | Created On: 2025-11-18 09:41:27                          
