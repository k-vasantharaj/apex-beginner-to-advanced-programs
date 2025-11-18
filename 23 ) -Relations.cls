public class CaseRelationService {

    public static void printCaseRelations() {
        // Query Cases with related Contact and Account fields
        List<Case> caseList = [
            SELECT Id,
                   Subject,
                   Contact.LastName,
                   Contact.Account.Name
            FROM Case
        ];

        for (Case cas : caseList) {
            System.debug('Case Id: ' + cas.Id);
            System.debug('Subject: ' + cas.Subject);
            System.debug('Contact LastName: ' + cas.Contact.LastName);
            System.debug('Account Name: ' + cas.Contact.Account.Name);
        }
    }
}

// Anonymous block execution
CaseRelationService.printCaseRelations();
