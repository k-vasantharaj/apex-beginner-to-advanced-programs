public class SuperMarket {

    public static void getResult() {

        // Query leads older than 6 months
        List<Lead> oldLeads = [
            SELECT Id, Name, CreatedDate, Status
            FROM Lead
            WHERE CreatedDate < LAST_N_MONTHS:6
        ];

        // Update the leads before deleting them (audit)
        for (Lead l : oldLeads) {
            l.Status = 'Archived';   // Added extra field
        }

        if (!oldLeads.isEmpty()) {
            update oldLeads;   // Save audit changes
            delete oldLeads;   // Delete leads
        }
    }
}
//Anonymous Apex Execution 
// Run the delete logic
SuperMarket.getResult();

// Re-query deleted records from Recycle Bin
List<Lead> deletedLeads = [
    SELECT Id, Name, CreatedDate, Status
    FROM Lead
    WHERE IsDeleted = true
    ALL ROWS
];

// Print results to debug
System.debug('--- Deleted Leads (from Recycle Bin) ---');
for (Lead l : deletedLeads) {
    System.debug(
        l.Name + ' | Created: ' + l.CreatedDate + ' | Status Before Delete: ' + l.Status
    );
}

// Sample Debug Output
--- Deleted Leads (from Recycle Bin) ---
Mark Davis | Created: 2024-01-13 10:22:55 | Status Before Delete: Archived
Test Lead 22 | Created: 2024-03-29 14:11:21 | Status Before Delete: Archived
Priya Joshi | Created: 2024-04-02 18:19:52 | Status Before Delete: Archived
