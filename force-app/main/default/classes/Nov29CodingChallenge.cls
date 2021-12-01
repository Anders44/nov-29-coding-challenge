public class Nov29CodingChallenge {
    public static List<Contact> stripInaccessibleMethod() {
        
        List<Contact> con = [SELECT Id, Account.Name, Name, Title, Email, Phone
        FROM CONTACT];

        System.debug(con);

        SObjectAccessDecision dec = Security.stripInaccessible(AccessType.READABLE, con, true);

        System.debug(dec.getRecords());


        return dec.getRecords();
    }
    
    public static List<Contact> withSecurityEnforcedClause() {
        
        try {
        List<Contact> con = [SELECT Id, Account.Name, Name, Title, Email, Phone
        FROM CONTACT WITH SECURITY_ENFORCED];
        } catch (exception e) {
            system.debug('There is a problem buddy');
            return null;

        }
        List<Contact> con = [SELECT Id, Account.Name, Name, Title, Email, Phone
        FROM CONTACT WITH SECURITY_ENFORCED];

        return con;
    }
    
    public static List<Contact> schemaNamespaceClasses() {

        //shout out to Zeke for figuring out how to put the object check and fields checks together.
        
        if (Schema.sObjectType.Contact.isAccessible()){
            
            List<Contact> contacts = new List<Contact>();
            
            string soqlName = '';
            string soqlTitle = '';
            string soqlEmail = '';
            string soqlPhone = '';
            string soqlAccount = '';
            
            if(Schema.SObjectType.contact.fields.Name.isAccessible()){
                soqlName = 'Name ';
            }
            if(Schema.SObjectType.contact.fields.Title.isAccessible()){
                soqlTitle = ',Title ';
            }
            if(Schema.SObjectType.contact.fields.Email.isAccessible()){
                soqlEmail = ',Email ';
            }
            if(Schema.SObjectType.contact.fields.Phone.isAccessible()){
                soqlPhone = ',Phone ';
            }
            if(Schema.SObjectType.contact.fields.AccountId.isAccessible()){
                soqlAccount = ',Account.Name ';
            }
            
            string soqlStatement = 'SELECT ' + soqlName + ' ' + soqlTitle + ' '  + soqlEmail + ' ' + soqlPhone + ' ' + soqlAccount + 'FROM Contact';
            contacts = database.query(soqlStatement);

            system.debug(contacts);

            return contacts;
        }
        
        else{
            return null;
        }
     }
}