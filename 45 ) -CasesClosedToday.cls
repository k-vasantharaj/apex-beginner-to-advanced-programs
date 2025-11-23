public class CaseClosedTodayFetcher {

    public static void getTodayClosedCases() {

        // Query all cases closed today
        List<Case> caseList = [
            SELECT Id, Subject, ClosedDate
            FROM Case
            WHERE ClosedDate = TODAY
        ];

        // Output results
        if (!caseList.isEmpty()) {
            for (Case c : caseList) {
                System.debug('Case Subject: ' + c.Subject +
                             ' | Closed On: ' + c.ClosedDate);
            }
        } else {
            System.debug('No cases closed today.');
        }
    }
}
                              
 //Anonymous Apex 
CaseClosedTodayFetcher.getTodayClosedCases();

// Sample Debug Output (Example)
Case Subject: Order Delay Issue | Closed On: 2025-11-23 10:22:41
Case Subject: Login Failure | Closed On: 2025-11-23 14:09:10                             
                              
