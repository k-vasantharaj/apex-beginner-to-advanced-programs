public class ContactAggregator {

    public static void getContactCountByAccount() {

        List<AggregateResult> aggregatedResults = [
            SELECT AccountId, COUNT(Id) contactCount
            FROM Contact
            GROUP BY AccountId
        ];

        for (AggregateResult record : aggregatedResults) {
            Id accountId = (Id) record.get('AccountId');
            Integer contactCount = (Integer) record.get('contactCount');

            System.debug('AccountId: ' + accountId + ' | Contact Count: ' + contactCount);
        }
    }
}
//Anonymous Apex Call
ContactAggregator.getContactCountByAccount();

//Sample Output
AccountId: 001XXXXXXXXXXXX | Contact Count: 5
AccountId: 001YYYYYYYYYYYY | Contact Count: 12
AccountId: 001ZZZZZZZZZZZZ | Contact Count: 3
