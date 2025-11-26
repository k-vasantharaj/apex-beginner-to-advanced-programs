// Check field level security before accessing
Schema.DescribeFieldResult emailField = Contact.Email.getDescribe();

if (emailField.isAccessible()) {

    List<Contact> conList = [
        SELECT Id, Email, Phone
        FROM Contact
        WHERE Phone != NULL
        LIMIT 10
    ];

    for (Contact con : conList) {
        System.debug('Contact Email: ' + con.Email);
    }

    System.debug('Total records fetched: ' + conList.size());

} else {
    System.debug('❌ User does not have permission to access Contact.Email');
}
//Expected Output

If permission exists and records found:

Contact Email: abc@example.com
Contact Email: xyz@example.com
Total Contacts Fetched: 20


If permission exists but no records:

Total Contacts Fetched: 0


If no field access:

⛔ Running user does not have permission to access Contact.Email field
