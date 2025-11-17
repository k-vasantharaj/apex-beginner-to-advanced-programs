/**
 * Class Name : Last30DaysOpportunityFetcher
 * Purpose    : Retrieve Opportunities whose CloseDate falls within the last 30 days
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class Last30DaysOpportunityFetcher {

    public static void displayRecentClosedOpportunities() {

        // Query Opportunities closed in the last 30 days
        List<Opportunity> oppList = [
            SELECT Id, Name, Amount, CloseDate
            FROM Opportunity
            WHERE CloseDate = LAST_30_DAYS
        ];

        System.debug('--- Opportunities Closed in Last 30 Days ---');

        for (Opportunity opp : oppList) {
            System.debug(
                'Opportunity: ' + opp.Name +
                ' | CloseDate: ' + opp.CloseDate +
                ' | Amount: ' + opp.Amount
            );
        }
    }
}
//Anonymous Apex Execution
Last30DaysOpportunityFetcher.displayRecentClosedOpportunities();
