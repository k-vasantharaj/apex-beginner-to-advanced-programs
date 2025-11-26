// Check if running user has read access to Account object and Name field
if (Schema.sObjectType.Account.isAccessible() &&
    Schema.sObjectType.Account.fields.Name.isAccessible()) {

    List<Account> accountList = [
        SELECT Name
        FROM Account
        LIMIT 10
    ];

    if (!accountList.isEmpty()) {
        for (Account acc : accountList) {
            System.debug('Account Name: ' + acc.Name);
        }
    } else {
        System.debug('No Accounts found');
    }

} else {
    System.debug('User does not have permission to read Account or Name field');
}
//Expected Anonymous Log Output

Case 1 — User has Read permission:

Account Name: Demo Account
Account Name: Universal Containers
...


Case 2 — User does NOT have permission:

User does not have permission to read Account or Name field
