// Check if user has Create access to Expense__c
if (Schema.sObjectType.Expense__c.isCreateable()) {

    Expense__c exp = new Expense__c(
        Name = 'XYZ Expense', 
        Amount__c = 1000      
    );

    insert exp;
    System.debug('Expense__c record inserted successfully: ' + exp.Id);

} else {
    System.debug('User does not have permission to create Expense__c');
}
//Expected Anonymous Execution Results

Case 1 — User has Create access

Expense__c record inserted successfully: a0BXXXX0000ABCDE


Case 2 — User does NOT have Create access

User does not have permission to create Expense__c
