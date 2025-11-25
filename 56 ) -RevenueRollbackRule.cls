public class SuperMarket {

    public void getResult() {

        Savepoint sp = Database.setSavepoint();
        
        try {
            // Insert Opportunity
            Opportunity opp = new Opportunity(
                Name = 'Demo Opportunity',
                StageName = 'Prospecting',
                CloseDate = System.today(),
                Amount = 300000    // Modified field
            );
            insert opp;

            // Fetch related Account details
            Account acc = [
                SELECT Id, AnnualRevenue 
                FROM Account 
                WHERE Id = :opp.AccountId
            ];

            acc.AnnualRevenue += opp.Amount;

            // Business Rule Validation
            if (acc.AnnualRevenue > 500000) {
                Database.rollback(sp);
                System.debug('⚠️ Business Rule: Revenue limit exceeded.');
                return; 
            }

            update acc;
        }
        catch (Exception e) {
            Database.rollback(sp);
            System.debug('⚠️ Exception triggered rollback: ' + e.getMessage());
        }
    }
}
//Result
⚠️ Business Rule: Revenue limit exceeded.

//Anonymous Apex — How to Run
SuperMarket sm = new SuperMarket();
sm.getResult();


To verify rollback or success:

System.debug('Opportunities inserted: ' + 
    [SELECT COUNT() FROM Opportunity WHERE Name = 'Demo Opportunity']);

System.debug('Accounts updated: ' +
    [SELECT COUNT() FROM Account WHERE AnnualRevenue > 500000]);
