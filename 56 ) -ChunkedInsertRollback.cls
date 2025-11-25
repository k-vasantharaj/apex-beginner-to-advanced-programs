public class LeadChunkProcessor {

    public static void processLeads() {

        List<Lead> leads = getLeads();

        for (Integer i = 0; i < leads.size(); i += 10) {

            Savepoint sp = Database.setSavepoint();

            try {
                // Split into chunks of 10
                List<Lead> chunk = leads.subList(i, Math.min(i + 10, leads.size()));
                insert chunk;

            } catch (Exception ex) {
                Database.rollback(sp);
                System.debug('⚠️ Failed chunk rolled back: ' + ex.getMessage());
            }
        }
    }

    // Sample data creator
    public static List<Lead> getLeads() {
        List<Lead> leadsList = new List<Lead>();

        for (Integer j = 0; j < 25; j++) {
            leadsList.add(new Lead(
                LastName = 'Lead ' + j,
                Company = 'DemoCompany ' + j,
                // Force an error for one record
                Email = (j == 13 ? null : 'lead' + j + '@test.com')
            ));
        }

        return leadsList;
    }
}
//Result
⚠️ Failed chunk rolled back: REQUIRED_FIELD_MISSING: Email
                     
//Anonymous Apex – Execution

Run this in Developer Console → Execute Anonymous:

LeadChunkProcessor.processLeads();


To check:

System.debug('Inserted Leads: ' + [SELECT COUNT() FROM Lead WHERE Company LIKE 'DemoCompany%']);


//Expected output:

Inserted Leads: 15                     
