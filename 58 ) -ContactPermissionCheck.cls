// Check if running user has permission to create Contact records
if (Schema.sObjectType.Contact.isCreateable()) {
    Contact con = new Contact(
        FirstName = 'John',
        LastName  = 'Doe',
        Email     = 'john.doe@test.com'
    );
    insert con;
    System.debug('Contact inserted successfully: ' + con.Id);
} else {
    System.debug('User does not have permission to create Contact');
}
//Possible Anonymous Window Results

Case 1 — User has Create access

Contact inserted successfully: 003XXXX0000ABCDE


Case 2 — User does NOT have Create access

User does not have permission to create Contact
