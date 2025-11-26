// Check if Account object is accessible for DML operations
if (Schema.sObjectType.Account.isCreateable()) {
    Account acc = new Account(
        Name = 'Demo Account',
        Phone = '9876543210' // Added another field
    );
    insert acc;
    System.debug('Account inserted successfully: ' + acc.Id);
} else {
    System.debug('User does not have permission to create Account');
}
//Expected Output in Anonymous Window

Case 1 — If profile has Create permission:

Account inserted successfully: 001XXXX0000ABCDE


Case 2 — If no Create permission:

User does not have permission to create Account
