public class TaskDueSoonFetcher {

    public static void getOpenTasksDueIn3Days() {

        // Fetch open tasks due in the next 3 days
        List<Task> taskList = [
            SELECT Id, Subject, Status, ActivityDate
            FROM Task
            WHERE Status = 'Open'
            AND ActivityDate = NEXT_N_DAYS:3
        ];

        // Output results
        if (!taskList.isEmpty()) {
            for (Task t : taskList) {
                System.debug('Task: ' + t.Subject +
                             ' | Due: ' + t.ActivityDate);
            }
        } else {
            System.debug('No open tasks due in the next 3 days.');
        }
    }
}
//Anonymous Apex 
TaskDueSoonFetcher.getOpenTasksDueIn3Days();

//Sample Debug Output 
Task: Follow up with client | Due: 2025-11-24
Task: Prepare sales report | Due: 2025-11-25
