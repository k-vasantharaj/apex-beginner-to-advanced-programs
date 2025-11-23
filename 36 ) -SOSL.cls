public class GlobalSearchExample {

    public static void executeSearch() {
        // SOSL query to search across Account, Contact, and Opportunity
        List<List<SObject>> results = [
            FIND 'Vas*'
            IN ALL FIELDS
            RETURNING 
                Account(Name),
                Contact(Email),
                Opportunity(Description)
        ];
        
        // Extracting results into specific typed lists
        List<Account> accountResults = (List<Account>) results[0];
        List<Contact> contactResults = (List<Contact>) results[1];
        List<Opportunity> opportunityResults = (List<Opportunity>) results[2];
        
        // Debug: Accounts
        for (Account acc : accountResults) {
            System.debug('Account Name: ' + acc.Name);
        }
        
        // Debug: Contacts
        for (Contact con : contactResults) {
            System.debug('Contact Email: ' + con.Email);
        }
        
        // Debug: Opportunities
        for (Opportunity opp : opportunityResults) {
            System.debug('Opportunity Description: ' + opp.Description);
        }
    }
}
