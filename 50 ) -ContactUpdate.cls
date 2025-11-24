public class SuperMarket {

    public static void getResult() {

        // Query Contacts with their Account Active status
        List<Contact> conList = [
            SELECT Id, Phone, Title, Account.Active__c
            FROM Contact
            WHERE AccountId != NULL
        ];
        
        // Prepare list for update
        List<Contact> toUpdate = new List<Contact>();

        for (Contact c : conList) {
            if (c.Account.Active__c == true) {
                c.Phone = '9999999999';
                c.Title = 'Verified Contact';   // Added extra field
                toUpdate.add(c);
            }
        }

        if (!toUpdate.isEmpty()) {
            update toUpdate;
        }
    }
}
//Anonymous Apex Execution
SuperMarket.getResult();

// Fetch updated contacts
List<Contact> results = [
    SELECT Id, FirstName, LastName, Phone, Title, Account.Active__c
    FROM Contact
    WHERE Phone = '9999999999'
    ORDER BY LastName
];

// Print results
System.debug('--- Updated Contacts ---');
for (Contact c : results) {
    System.debug(
        c.FirstName + ' ' + c.LastName + 
        ' | ' + c.Phone +
        ' | ' + c.Title +
        ' | Active: ' + c.Account.Active__c
    );
}

// Sample Debug Output
--- Updated Contacts ---
John Doe | 9999999999 | Verified Contact | Active: true
Priya Sharma | 9999999999 | Verified Contact | Active: true
Liam Patel | 9999999999 | Verified Contact | Active: true
