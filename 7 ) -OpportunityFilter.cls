/**
 * Class Name: OpportunityFilter
 * Author: Vasantharaj K
 * Description:
 *   This utility class provides a method to retrieve all 
 *   Opportunity records whose Amount value is greater than 
 *   a specified minimum amount.
 *   The method ensures the input is valid and returns only 
 *   meaningful filtered results.
 */
public class OpportunityFilter {

    /**
     * Retrieves Opportunity records with Amount greater than the given value.
     *
     * @param minAmount  Minimum Amount used for filtering records.
     * @return List<Opportunity>  List of matching Opportunity records.
     * @throws IllegalArgumentException if minAmount is null.
     */
    public static List<Opportunity> getOppsGreaterThanAmount(Decimal minAmount) 
    {
        if (minAmount == null) {
            throw new IllegalArgumentException('Amount cannot be null.');
        }

        return [
            SELECT Id, Name, Amount, StageName, CloseDate
            FROM Opportunity
            WHERE Amount > :minAmount
        ];
    }
}
// -------- Execution Example -------- //
List<Opportunity> oppList = OpportunityFilter.getOppsGreaterThanAmount(5000);
System.debug(oppList);
