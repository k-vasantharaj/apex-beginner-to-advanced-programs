// Describe the Phone field on Account
Schema.DescribeFieldResult phoneField = Account.Phone.getDescribe();

// Check whether the user has update permission for the field
if (phoneField.isUpdateable()) {

    // Query Accounts where Phone is blank AND BillingCity also to show additional usage
    List<Account> accList = [
        SELECT Id, Phone, BillingCity 
        FROM Account 
        WHERE Phone = NULL
        LIMIT 10
    ];

    // Update Phone and add default Billing City
    for (Account acc : accList) {
        acc.Phone = '9876543210';
        acc.BillingCity = 'Chennai'; // Example additional field
    }

    if (!accList.isEmpty()) {
        update accList;
        System.debug('✔ Successfully updated phone numbers for ' + accList.size() + ' Accounts.');
    } else {
        System.debug('ℹ No Accounts found with missing phone number.');
    }

} else {
    System.debug('⛔ User does not have permission to update Account.Phone field.');
}
//Expected Debug Results

Case 1 — User has permission and records found:

✔ Successfully updated phone numbers for 10 Accounts.


Case 2 — No record qualifies:

ℹ No Accounts found with missing phone number.


Case 3 — User has no field permission:

⛔ User does not have permission to update Account.Phone field.
