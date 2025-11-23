public class OpportunityFiscalYearFetcher {

    public static void getOpportunitiesCreatedThisFiscalYear() {

        // Query opportunities created in current fiscal year
        List<Opportunity> oppList = [
            SELECT Id, Name, Amount, CreatedDate
            FROM Opportunity
            WHERE CreatedDate = THIS_FISCAL_YEAR
        ];

        // Print results
        if (!oppList.isEmpty()) {
            for (Opportunity opp : oppList) {
                System.debug(
                    'Opportunity: ' + opp.Name +
                    ' | Amount: ' + opp.Amount +
                    ' | Created On: ' + opp.CreatedDate
                );
            }
        } else {
            System.debug('No opportunities created this fiscal year.');
        }
    }
}
//Anonymous Apex 
OpportunityFiscalYearFetcher.getOpportunitiesCreatedThisFiscalYear();

// Sample Debug Output (Example)
Opportunity: New Manufacturing Deal | Amount: 45000 | Created On: 2025-04-12 11:30:22
Opportunity: Renewal - Global Corp | Amount: 120000 | Created On: 2025-06-07 09:14:55
