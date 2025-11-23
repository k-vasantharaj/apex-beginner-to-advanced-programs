public class AccountDateRangeFetcher {

    public static void getAccountsInRange(DateTime startTime, DateTime endTime) {

        // Query accounts created within the given DateTime range
        List<Account> accList = [
            SELECT Id, Name, Industry, CreatedDate
            FROM Account
            WHERE CreatedDate >= :startTime
              AND CreatedDate <= :endTime
        ];

        // Print results
        if (!accList.isEmpty()) {
            for (Account acc : accList) {
                System.debug(
                    'Account: ' + acc.Name +
                    ' | Industry: ' + acc.Industry +
                    ' | Created On: ' + acc.CreatedDate
                );
            }
        } else {
            System.debug('No accounts found for the given date range.');
        }
    }
}
//Anonymous Apex 
DateTime startTime = DateTime.newInstance(2025, 11, 1, 0, 0, 0);
DateTime endTime   = DateTime.newInstance(2025, 11, 20, 23, 59, 59);

AccountDateRangeFetcher.getAccountsInRange(startTime, endTime);

// Sample Debug Output (Example)
Account: Acme Corp | Industry: Manufacturing | Created On: 2025-11-05 10:12:44
Account: Global Tech | Industry: Technology | Created On: 2025-11-11 15:47:09
Account: Nova Foods | Industry: Retail | Created On: 2025-11-18 09:32:55
