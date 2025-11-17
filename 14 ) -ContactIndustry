/**
 * Class Name : ContactIndustryFetcher
 * Purpose    : Fetch Contacts and display their related Account's Industry
 * Author     : Vasantharaj K
 * Date       : 17-Nov-2025
 */

public class ContactIndustryFetcher {

    public static void displayContactIndustries() {

        // Query Contacts with parent Account's Industry using relationship query
        List<Contact> conList = [
            SELECT Id, LastName, Account.Industry
            FROM Contact
            WHERE AccountId != NULL
        ];

        System.debug('--- Contact → Account Industry ---');

        for (Contact con : conList) {
            System.debug(
                'Contact: ' + con.LastName +
                ' | Industry: ' + con.Account.Industry
            );
        }
    }
}
//Anonymous Apex Execution
ContactIndustryFetcher.displayContactIndustries();
