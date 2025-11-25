public class SuperMarket {

    public void getResult() {

        Savepoint sp = Database.setSavepoint();
        
        try {
            // Create Account
            Account acc = new Account(
                Name = 'Demo Account',
                Phone = '9876543210'
            );
            insert acc;

            // Valid Contact
            Contact con1 = new Contact(
                LastName = 'Valid Contact',
                Email = 'valid@example.com',
                AccountId = acc.Id
            );

            // Invalid Contact (LastName is mandatory)
            Contact con2 = new Contact(
                LastName = null,
                Email = 'invalid@example.com',
                AccountId = acc.Id
            );

            insert new List<Contact>{ con1, con2 };
        }
        catch (Exception e) {
            Database.rollback(sp);
            System.debug('⚠️ ROLLBACK happened because: ' + e.getMessage());
        }
    }
}
//Result

Account insert succeeds initially

First contact (valid) can insert

Second contact fails (LastName = null → REQUIRED FIELD)

Exception thrown → rollback to savepoint

Account and both contacts are not inserted

Debug log prints:

⚠️ ROLLBACK happened because: REQUIRED_FIELD_MISSING: Required fields are missing: [LastName]

//Anonymous Apex 

Copy-paste this in Execute Anonymous Window:

SuperMarket sm = new SuperMarket();
sm.getResult();

//Expected output:

Accounts found: 0
Contacts found: 0
