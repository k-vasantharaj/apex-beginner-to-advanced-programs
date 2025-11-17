public class Demo {

    public Demo(String objName, List<String> fields) {
        // Convert list of fields into comma-separated string
        String fieldList = String.join(fields, ',');

        // Build dynamic SOQL query
        String query = 'SELECT ' + fieldList + ' FROM ' + objName;

        // Execute and debug the results
        List<SObject> records = Database.query(query);
        System.debug(records);
    }
}

// Test the class
String objName = 'Account';
List<String> fields = new List<String>{ 'Rating', 'Name' };
Demo d = new Demo(objName, fields);
