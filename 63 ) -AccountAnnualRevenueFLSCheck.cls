// Check if the running user has access to Account.AnnualRevenue
if (Schema.sObjectType.Account.fields.AnnualRevenue.isAccessible()) {

    List<Account> accList = [SELECT AnnualRevenue FROM Account LIMIT 10];

    if (!accList.isEmpty()) {
        for (Account acc : accList) {
            System.debug('Account AnnualRevenue: ' + acc.AnnualRevenue);
        }
    } else {
        System.debug('No Account records found');
    }

} else {
    System.debug('User does not have permission to access Account.AnnualRevenue field');
}
//Expected Anonymous Execution Results

Case 1 — User has field access

Account AnnualRevenue: 1000000
Account AnnualRevenue: 500000
...


Case 2 — User lacks field access

User does not have permission to access Account.AnnualRevenue field
