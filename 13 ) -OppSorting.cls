/**
 * Class Name : OpportunitySorter
 * Purpose    : Retrieve and display Opportunities sorted by Close Date (Latest → Oldest)
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class OpportunitySorter {

    public static void displaySortedOpportunities() {

        // Query Opportunities sorted by CloseDate (DESC)
        List<Opportunity> oppList = [
            SELECT Id, Name, Amount, StageName, CloseDate
            FROM Opportunity
            ORDER BY CloseDate DESC
        ];

        // Debug output
        System.debug('--- Sorted Opportunity List ---');
        for (Opportunity opp : oppList) {
            System.debug(
                'Opportunity: ' + opp.Name +
                ' | Amount: ' + opp.Amount +
                ' | Stage: ' + opp.StageName +
                ' | CloseDate: ' + opp.CloseDate
            );
        }
    }
}
//Anonymous Apex Execution
OpportunitySorter.displaySortedOpportunities();
