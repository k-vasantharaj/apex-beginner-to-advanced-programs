public class ContactCaseService {

    public static void printContactCases() {
        // Query Contacts along with their related Cases
        List<Contact> conList = [
            SELECT LastName,
                   (SELECT Id, Subject, Status FROM Cases)
            FROM Contact
        ];

        for (Contact con : conList) {
            List<Case> casList = con.Cases;

            for (Case cas : casList) {
                System.debug('Case Id: ' + cas.Id);
                System.debug('Subject: ' + cas.Subject);
                System.debug('Status: ' + cas.Status);
            }
        }
    }
}

// Anonymous block execution
ContactCaseService.printContactCases();
