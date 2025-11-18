/**
 * @description   Utility class to group Closed Won and Closed Lost Opportunities
 *                by their AccountId.
 * @author        Vasantharaj K
 * @date          17-Nov-2025
 */
public class OpportunityGroupingService {

    /**
     * @description Returns a map of AccountId -> List of Opportunities
     *              filtered by Closed Won and Closed Lost stage names.
     * @return Map<Id, List<Opportunity>>
     */
    public static Map<Id, List<Opportunity>> getClosedOppsByAccount() {

        Map<Id, List<Opportunity>> accIdToOppsMap = new Map<Id, List<Opportunity>>();

        List<Opportunity> oppList = [
            SELECT Id, Name, StageName, AccountId
            FROM Opportunity
            WHERE StageName IN ('Closed Won', 'Closed Lost')
            AND AccountId != NULL
        ];

        for (Opportunity opp : oppList) {
            if (!accIdToOppsMap.containsKey(opp.AccountId)) {
                accIdToOppsMap.put(opp.AccountId, new List<Opportunity>());
            }
            accIdToOppsMap.get(opp.AccountId).add(opp);
        }

        return accIdToOppsMap;
    }
}
//Anonymous Apex Execution
Map<Id, List<Opportunity>> resultMap = OpportunityGroupingService.getClosedOppsByAccount();
System.debug(resultMap);
