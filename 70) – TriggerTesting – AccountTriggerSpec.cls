trigger AccountTrigger on Account (after insert) {

    /*
     * Automatically create a Support Contact
     * whenever a new Account is inserted.
     */

    List<Contact> contactsToInsert = new List<Contact>();

    for (Account acc : Trigger.new) {

        Contact supportContact = new Contact(
            AccountId = acc.Id,
            LastName  = acc.Name + ' Support'
        );

        contactsToInsert.add(supportContact);
    }

    if (!contactsToInsert.isEmpty()) {
        insert contactsToInsert;
    }
}

//---------------------------------------------------------------------------------
@IsTest
public class AccountTriggerSpec {

    @IsTest
    static void shouldCreateSupportContactOnAccountInsert() {

        // Arrange
        Account acc = new Account(
            Name = 'Test Account'
        );

        // Act
        insert acc;

        // Assert
        List<Contact> contacts = [
            SELECT Id, LastName, AccountId
            FROM Contact
            WHERE AccountId = :acc.Id
        ];

        System.assertEquals(
            1,
            contacts.size(),
            'One support contact should be created'
        );

        System.assertEquals(
            'Test Account Support',
            contacts[0].LastName,
            'Contact last name should follow naming convention'
        );
    }
}

//----------------------------------------------------------------------------------------------------------------
/*
69) How do you write an after-insert Apex trigger on Account to automatically create a related Contact,
and how do you validate the behavior using a test class?
*/
