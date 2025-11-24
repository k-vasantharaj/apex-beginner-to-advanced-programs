public class SuperMarket {

    public static void getResult() {

        // Create Account
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        // Create Contacts linked to the Account
        Contact c1 = new Contact(
            LastName = 'Test Contact 1',
            Phone = '9000000001',
            AccountId = acc.Id          // Link to account
        );

        Contact c2 = new Contact(
            LastName = 'Test Contact 2',
            Phone = '9000000002',
            AccountId = acc.Id
        );

        insert new List<Contact>{ c1, c2 };
    }
}
//Anonymous Apex Execution
// Run logic
SuperMarket.getResult();

// Query new Account + Contacts
List<Account> acc = [
    SELECT Id, Name,
        (SELECT Id, LastName, Phone FROM Contacts)
    FROM Account
    WHERE Name = 'Test Account'
    LIMIT 1
];

System.debug('--- Created Account & Contacts ---');

for (Contact c : acc[0].Contacts) {
    System.debug(
        acc[0].Name + ' | ' + c.LastName + ' | ' + c.Phone
    );
}

// Sample Debug Output
--- Created Account & Contacts ---
Test Account | Test Contact 1 | 9000000001
Test Account | Test Contact 2 | 9000000002
