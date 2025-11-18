/**
 * Class Name: OpportunityService
 * Author: Vasantharaj K
 * Description:
 *   This service class provides a method to calculate the total
 *   Opportunity Amount for records that match a specific StageName.
 *   It ensures input validation and safely handles null Amount values.
 */
public with sharing class OpportunityService {

    /**
     * Calculates the total Amount for Opportunities with the given StageName.
     *
     * @param stageName  The StageName used to filter Opportunity records.
     * @return Decimal   The sum of Amount values (nulls treated as 0).
     * @throws IllegalArgumentException if the stageName is blank.
     */
    public static Decimal sumOppAmountByStage(String stageName) {
        if (String.isBlank(stageName)) {
            throw new IllegalArgumentException('Stage name cannot be blank.');
        }

        Decimal total = 0;

        List<Opportunity> opps = [
            SELECT Amount
            FROM Opportunity
            WHERE StageName = :stageName
        ];

        for (Opportunity opp : opps) {
            total += (opp.Amount == null ? 0 : opp.Amount);
        }

        return total;
    }
}
// -------- Execution Example -------- //
Decimal total = OpportunityService.sumOppAmountByStage('Qualification');
System.debug(total);
