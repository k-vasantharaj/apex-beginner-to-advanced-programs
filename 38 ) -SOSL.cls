public class SoslCaseFilterExample {

    public static void runSearch() {
        
        // Step 1: Perform SOSL search on Case Subject
        List<List<SObject>> results = [
            FIND 'support'
            IN ALL FIELDS
            RETURNING 
                Case(Id, Subject)
        ];
        
        List<Case> soslCases = (List<Case>) results[0];
        
        // Collect Case IDs 
        Set<Id> caseIds = new Set<Id>();
        for (Case cs : soslCases) {
            caseIds.add(cs.Id);
        }
        
        // Step 2: Use SOQL to filter only open Cases
        List<Case> openCases = new List<Case>();
        if (!caseIds.isEmpty()) {
            openCases = [
                SELECT Id, Subject, Status
                FROM Case
                WHERE Id IN :caseIds
                AND Status = 'Open'
            ];
        }
        
        // Debug results
        for (Case cs : openCases) {
            System.debug('Open Case: ' + cs.CaseNumber + ', Status: ' + cs.Status);
        }
    }
}
