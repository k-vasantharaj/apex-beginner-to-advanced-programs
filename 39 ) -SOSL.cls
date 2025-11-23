public class SoslWildcardContactSearch {

    public static void runSearch() {
        
        // SOSL wildcard search for Contacts whose email contains '.org'
        List<List<SObject>> results = [
            FIND '*.org*'
            IN ALL FIELDS
            RETURNING 
                Contact(Id, Name, Email)
        ];
        
        List<Contact> contactResults = (List<Contact>) results[0];
        
        // Debug output
        for (Contact c : contactResults) {
            System.debug('Contact Name: ' + c.Name);
            System.debug('Contact Email: ' + c.Email);
        }
    }
}
