public class SuperMarket {

    public static void getResult() {
        
        // Create list to hold new accounts
        List<Account> accList = new List<Account>();
        
        // Insert 200 accounts
        for (Integer i = 0; i < 200; i++) {
            accList.add(new Account(
                Name = 'Test Account ' + i,
                Type = 'Prospect'           // Added extra field
            ));
        }
        insert accList;
        
        // Update fields after insert
        for (Account acc : accList) {
            acc.Industry = 'Banking';
            acc.Type = 'Customer';         // Update another field
        }
        update accList;
    }
}
//Anonymous Apex Execution
SuperMarket.getResult();

// Query inserted & updated records
List<Account> results = [
    SELECT Id, Name, Industry, Type
    FROM Account
    WHERE Name LIKE 'Test Account %'
    ORDER BY Name
];

System.debug('--- Final Results ---');
for (Account acc : results) {
    System.debug(acc.Name + ' | ' + acc.Industry + ' | ' + acc.Type);
}

// Output Example in Logs
Test Account 0 | Banking | Customer
Test Account 1 | Banking | Customer
Test Account 2 | Banking | Customer
...
Test Account 199 | Banking | Customer
