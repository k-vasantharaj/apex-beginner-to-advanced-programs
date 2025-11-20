public class superMarket {

    public void getResult() {
        List<AggregateResult> result = [
            SELECT OwnerId, COUNT(Id) countOfopp
            FROM Opportunity
            GROUP BY OwnerId
            ORDER BY COUNT(Id) DESC
        ];

        for (AggregateResult ar : result) {
            String ownerId = (String) ar.get('OwnerId');  
            Integer countOfopp = (Integer) ar.get('countOfopp'); 

            System.debug('Owner: ' + ownerId + ' | countOfopp: ' + countOfopp);
        }
    }
}
//Asynchronous Call
superMarket sm = new superMarket();
sm.getResult();
//Result   
Owner: 005XXXXXXXXXXXX | countOfopp: 14
Owner: 005YYYYYYYYYYYY | countOfopp: 9
Owner: 005ZZZZZZZZZZZZ | countOfopp: 3                          
