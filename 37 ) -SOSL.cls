public class SoslSearchDemo {

    public static void runSearch() {
        
        // SOSL query to search across Account, Contact, and Case objects
        List<List<SObject>> results = [
            FIND 'raj*'
            IN ALL FIELDS
            RETURNING 
                Account(Name),
                Contact(Name, Phone),
                Case(CaseNumber)
        ];
        
        System.debug('Raw Results: ' + results);
        
        // Extract typed results
        List<Account> accountResults = (List<Account>) results[0];
        List<Contact> contactResults = (List<Contact>) results[1];
        List<Case> caseResults = (List<Case>) results[2];
        
        // Accounts
        for (Account acc : accountResults) {
            System.debug('Account Name: ' + acc.Name);
        }
        
        // Contacts
        for (Contact con : contactResults) {
            System.debug('Contact Name: ' + con.Name);
            System.debug('Contact Phone: ' + con.Phone);
        }
        
        // Cases
        for (Case cs : caseResults) {
            System.debug('Case Number: ' + cs.CaseNumber);
        }
    }
}
