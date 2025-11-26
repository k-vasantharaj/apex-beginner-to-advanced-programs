// Check if user has Update permission for Opportunity object
if (Schema.sObjectType.Opportunity.isUpdateable()) {

    List<Opportunity> oppList = [
        SELECT StageName 
        FROM Opportunity 
        WHERE CreatedDate = TODAY
    ];

    for (Opportunity opp : oppList) {
        opp.StageName = 'Prospecting';
    }

    update oppList;
    System.debug('Successfully updated Opportunities: ' + oppList.size());

} else {
    System.debug('User does not have permission to update Opportunity');
}
//Anonymous Execution Results

Case 1 — User has Update access

Successfully updated Opportunities: X


Case 2 — Permission missing

User does not have permission to update Opportunity
