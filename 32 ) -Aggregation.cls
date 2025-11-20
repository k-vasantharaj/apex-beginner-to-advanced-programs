public class ContactCountFilter {

    public static void getAccountsWithMoreThanTwoContacts() {

        List<AggregateResult> aggregatedResults = [
            SELECT AccountId, COUNT(Id) contactCount
            FROM Contact
            GROUP BY AccountId
            HAVING COUNT(Id) > 2
        ];

        for (AggregateResult record : aggregatedResults) {
            Id accountId = (Id) record.get('AccountId');
            Integer contactCount = (Integer) record.get('contactCount');

            System.debug('AccountId: ' + accountId + ' | Contact Count: ' + contactCount);
        }
    }
}
//Anonymous Apex Call
ContactCountFilter.getAccountsWithMoreThanTwoContacts();
//Sample Debug Output     
AccountId: 001XXXXXXXXXXXX | Contact Count: 3
AccountId: 001YYYYYYYYYYYY | Contact Count: 5
AccountId: 001ZZZZZZZZZZZZ | Contact Count: 7
                          
