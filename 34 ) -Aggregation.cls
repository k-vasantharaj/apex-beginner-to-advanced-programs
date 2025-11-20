public class OpportunityProductCounter {

    public static void getProductsWithMoreThanFiveLineItems() {

        List<AggregateResult> aggregatedResults = [
            SELECT PricebookEntry.Product2Id, COUNT(Quantity) lineItemCount
            FROM OpportunityLineItem
            GROUP BY PricebookEntry.Product2Id
            HAVING COUNT(Quantity) > 5
        ];

        for (AggregateResult record : aggregatedResults) {
            Id productId = (Id) record.get('Product2Id');
            Integer lineItemCount = (Integer) record.get('lineItemCount');

            System.debug('Product2Id: ' + productId + ' | Line Item Count: ' + lineItemCount);
        }
    }
}
//Anonymous Apex Call
OpportunityProductCounter.getProductsWithMoreThanFiveLineItems();
                          
//Sample Debug Output
Product2Id: 01tXXXXXXXXXXXX | Line Item Count: 7
Product2Id: 01tYYYYYYYYYYYY | Line Item Count: 12                          
