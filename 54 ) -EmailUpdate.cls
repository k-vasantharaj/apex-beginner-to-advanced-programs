public class SuperMarket {

    public static void getResult() {

        // Query contacts with missing email
        List<Contact> conList = [
            SELECT Id, Email, Description
            FROM Contact
            WHERE Email = NULL
        ];

        // Update email + extra field
        for (Contact con : conList) {
            con.Email = 'unknownMail@gmail.com';
            con.Description = 'Email auto-updated';   // Added field
        }

        if (!conList.isEmpty()) {
            update conList;
        }
    }
}
//Anonymous Apex Execution
SuperMarket.getResult();

// Query updated contacts
List<Contact> results = [
    SELECT Id, FirstName, LastName, Email, Description
    FROM Contact
    WHERE Email = 'unknownMail@gmail.com'
];

System.debug('--- Updated Contacts ---');
for (Contact c : results) {
    System.debug(
        c.FirstName + ' ' + c.LastName +
        ' | ' + c.Email +
        ' | ' + c.Description
    );
}

// Sample Debug Output
--- Updated Contacts ---
John Doe | unknownMail@gmail.com | Email auto-updated
Priya K | unknownMail@gmail.com | Email auto-updated
Sam Patel | unknownMail@gmail.com | Email auto-updated
