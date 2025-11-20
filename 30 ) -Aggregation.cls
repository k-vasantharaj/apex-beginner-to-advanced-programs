public class CasePriorityAggregator {

    public static void getOpenCaseCountByPriority() {

        List<AggregateResult> aggregatedResults = [
            SELECT Priority, COUNT(Id) caseCount
            FROM Case
            WHERE Status != 'Closed'
            GROUP BY Priority
        ];

        for (AggregateResult record : aggregatedResults) {
            String priority = (String) record.get('Priority');
            Integer caseCount = (Integer) record.get('caseCount');

            System.debug('Priority: ' + priority + ' | Case Count: ' + caseCount);
        }
    }
}
//Anonymous Apex Call
CasePriorityAggregator.getOpenCaseCountByPriority();
                          
//Sample Debug Output
Priority: High | Case Count: 8
Priority: Medium | Case Count: 21
Priority: Low | Case Count: 5                     

                          
                          

                          
