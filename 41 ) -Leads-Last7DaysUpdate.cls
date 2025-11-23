public class LeadRecentUpdateService {

    public static List<Lead> getLeadsUpdatedLast7Days() {

        List<Lead> leads = [
            SELECT Id, Name, Status, LastModifiedDate
            FROM Lead
            WHERE LastModifiedDate = LAST_N_DAYS:7
        ];

        return leads;
    }
}
