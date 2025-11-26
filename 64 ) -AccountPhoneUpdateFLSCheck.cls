// Check if user has update access to Account.Phone field
if (Schema.sObjectType.Account.fields.Phone.isUpdateable()) {

    List<Account> accList = [SELECT Phone FROM Account WHERE Phone = null ];

    if (!accList.isEmpty()) {
        for (Account acc : accList) {
            acc.Phone = '9876570978';
        }
        update accList;
        System.debug('Updated Account Phone for ' + accList.size() + ' records');
    } else {
        System.debug('No Account records with null Phone found');
    }

} else {
    System.debug('User does not have permission to update Account.Phone');
}
//Expected Anonymous Execution Results

Case 1 — User has field update access

Updated Account Phone for 5 records


Case 2 — User lacks field update access

User does not have permission to update Account.Phone


Case 3 — No matching records

No Account records with null Phone found
