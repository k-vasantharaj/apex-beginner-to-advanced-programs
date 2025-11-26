// Check if running user has delete access to Case object
if (Schema.sObjectType.Case.isDeletable()) {

    List<Case> caseList = [
        SELECT Subject
        FROM Case
        WHERE CreatedDate < LAST_N_YEARS:1
    ];

    if (!caseList.isEmpty()) {
        delete caseList;
        System.debug('Deleted Cases: ' + caseList.size());
    } else {
        System.debug('No cases found to delete');
    }

} else {
    System.debug('User does not have permission to delete Case');
}
//Expected Anonymous Execution Results

Case 1 — User has permission

Deleted Cases: X


Case 2 — No permission

User does not have permission to delete Case


Case 3 — No matching records

No cases found to delete
