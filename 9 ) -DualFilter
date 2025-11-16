/**
 * Class Name: OpportunityDualFilter
 * Author: Vasantharaj K
 * Description:
 *   This utility class provides a method to count the number of
 *   Opportunity records that match both StageName and LeadSource.
 *   It validates inputs and ensures only meaningful filters are applied.
 */
public class OpportunityDualFilter {

    /**
     * Returns the count of Opportunity records matching both StageName and LeadSource.
     *
     * @param stageName   The StageName used for filtering records.
     * @param leadSource  The LeadSource used for filtering records.
     * @return Integer    Count of matching Opportunity records.
     * @throws IllegalArgumentException if both stageName and leadSource are blank.
     */
    public static Integer getOppsStageNameCount(String stageName, String leadSource) 
    {
        if (String.isBlank(stageName) && String.isBlank(leadSource)) {
            throw new IllegalArgumentException('StageName and LeadSource cannot both be null or blank.');
        }

        Integer oppCount = [
            SELECT COUNT()
            FROM Opportunity
            WHERE StageName = :stageName AND LeadSource = :leadSource
        ];

        return oppCount;
    }
}
// -------- Execution Example -------- //
Integer oppCount = OpportunityDualFilter.getOppsStageNameCount('Prospecting', 'Web');
System.debug(oppCount);
