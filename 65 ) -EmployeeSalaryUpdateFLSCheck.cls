// Check if user has update access to Employee__c.salary__c
if (Schema.sObjectType.Employee__c.fields.salary__c.isUpdateable()) {

    List<Employee__c> empList = [SELECT salary__c FROM Employee__c LIMIT 10];

    if (!empList.isEmpty()) {
        for (Employee__c emp : empList) {
            System.debug('Employee Salary: ' + emp.salary__c);
        }
    } else {
        System.debug('No Employee__c records found');
    }

} else {
    System.debug('User does not have permission to update Employee__c.salary__c');
}
//Expected Anonymous Execution Results

Case 1 — User has field update access

Employee Salary: 50000
Employee Salary: 75000
...


Case 2 — User lacks field update access

User does not have permission to update Employee__c.salary__c


Case 3 — No records

No Employee__c records found
