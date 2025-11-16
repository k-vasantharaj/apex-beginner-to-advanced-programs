/**
 * Class Name: OpportunityStageCounter
 * Author: Vasantharaj K
 * Description:
 *   This utility class provides a method to return the total 
 *   number of Opportunity records that match a given StageName.
 *   It validates the input and ensures meaningful output.
 */
public class OpportunityStageCounter {

    /**
     * Returns the count of Opportunity records for a specific StageName.
     *
     * @param stageName  The StageName to filter Opportunity records.
     * @return Integer   Count of matching Opportunity records.
     * @throws IllegalArgumentException if stageName is null or blank.
     */
    public static Integer getOppsStageNameCount(String stageName) 
    {
        if (String.isBlank(stageName)) {
            throw new IllegalArgumentException('StageName cannot be null or blank.');
        }

        Integer oppCount = [
            SELECT COUNT()
            FROM Opportunity
            WHERE StageName = :stageName
        ];

        return oppCount;
    }
}
