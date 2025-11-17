/**
 * Class Name : HighRevenueOpportunityFetcher
 * Purpose    : Retrieve Opportunities where the parent Account has AnnualRevenue > 100000
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class HighRevenueOpportunityFetcher {

    public static void displayHighRevenueOpportunities() {

        // Query Opportunities filtered by parent Account's AnnualRevenue
        List<Opportunity> oppList = [
            SELECT Id, Name, Amount, Account.AnnualRevenue
            FROM Opportunity
            WHERE Account.AnnualRevenue > 100000
        ];

        System.debug('--- Opportunities from High-Revenue Accounts ---');

        for (Opportunity opp : oppList) {
            System.debug(
                'Opportunity: ' + opp.Name +
                ' | Amount: ' + opp.Amount +
                ' | AnnualRevenue: ' + opp.Account.AnnualRevenue
            );
        }
    }
}
//Anonymous Apex Execution
HighRevenueOpportunityFetcher.displayHighRevenueOpportunities();
