public class SuperMarket {

    public static void getResult() {

        // Create sample accounts
        List<Account> accList = new List<Account>{
            new Account(Name = 'Test A', AnnualRevenue = 90000000),
            new Account(Name = 'Test B', AnnualRevenue = 70000000),
            new Account(Name = 'Test C', AnnualRevenue = 50000000)
        };

        insert accList;

        // Update accounts based on revenue
        for (Account acc : accList) {
            if (acc.AnnualRevenue > 80000000) {
                acc.VIP__c = true;                // Your existing field
                acc.Industry = 'High Revenue';    // Added field for enhancement
            }
        }

        update accList;
    }
}
//Anonymous Apex Execution
// Run the method
SuperMarket.getResult();

// Query updated accounts
List<Account> results = [
    SELECT Name, AnnualRevenue, VIP__c, Industry
    FROM Account
    WHERE Name LIKE 'Test%'
    ORDER BY AnnualRevenue DESC
];

System.debug('--- Updated Account Results ---');

for (Account a : results) {
    System.debug(
        a.Name + ' | ' + a.AnnualRevenue + ' | VIP: ' + a.VIP__c +
        ' | Industry: ' + a.Industry
    );
}

// Sample Debug Output
--- Updated Account Results ---
Test A | 90000000 | VIP: true | Industry: High Revenue
Test B | 70000000 | VIP: false | Industry: null
Test C | 50000000 | VIP: false | Industry: null
