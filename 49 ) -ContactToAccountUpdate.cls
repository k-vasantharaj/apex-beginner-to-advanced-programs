public class SuperMarket {

    public static void getResult() {
        
        // Step 1: Get all AccountIds linked to Contacts
        Set<Id> accIds = new Set<Id>();
        
        List<Contact> conList = [
            SELECT AccountId
            FROM Contact
            WHERE AccountId != NULL
        ];
        
        for (Contact con : conList) {
            accIds.add(con.AccountId);
        }
        
        // Step 2: Fetch those Accounts
        List<Account> accList = [
            SELECT Id, Rating, Industry
            FROM Account
            WHERE Id IN :accIds
        ];
        
        // Step 3: Update fields
        for (Account acc : accList) {
            acc.Rating = 'Hot';
            acc.Industry = 'Banking';   // Added additional field update
        }
        
        update accList;
    }
}
//Anonymous Apex Execution
SuperMarket.getResult();

// Query updated accounts
List<Account> result = [
    SELECT Id, Name, Rating, Industry
    FROM Account
    WHERE Rating = 'Hot'
    ORDER BY Name
];

// Print results
System.debug('--- Updated Accounts ---');
for (Account acc : result) {
    System.debug(acc.Name + ' | ' + acc.Rating + ' | ' + acc.Industry);
}

//Sample Log Output
--- Updated Accounts ---
Acme Corp | Hot | Banking
Express Logistics | Hot | Banking
Test Account | Hot | Banking
...
