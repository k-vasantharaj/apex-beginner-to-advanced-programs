// Check if the running user has Create access to both User and Contact
if (Schema.sObjectType.User.isCreateable() && Schema.sObjectType.Contact.isCreateable()) {

    // Create a new Contact
    Contact con = new Contact(
        LastName = 'Demo Contact',
        Email = 'demo.contact@test.com'
    );
    insert con;
    System.debug('Contact inserted successfully: ' + con.Id);

    // Create a new User (simplified example)
    User newUser = new User(
        FirstName = 'Demo',
        LastName = 'User',
        Username = 'demouser' + System.currentTimeMillis() + '@test.com',
        Email = 'demouser@test.com',
        Alias = 'demou',
        ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id,
        TimeZoneSidKey = 'Asia/Kolkata',
        LocaleSidKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LanguageLocaleKey = 'en_US'
    );

    insert newUser;
    System.debug('User inserted successfully: ' + newUser.Id);

} else {
    System.debug('User does not have permission to create Contact or User');
}
//Expected Anonymous Execution Results

Case 1 — User has Create access for both

Contact inserted successfully: 003XXXX0000ABCDE
User inserted successfully: 005XXXX0000ABCDE


Case 2 — User lacks permission

User does not have permission to create Contact or User
