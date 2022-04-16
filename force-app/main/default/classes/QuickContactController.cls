public class QuickContactController {
    @AuraEnabled
    public static Contact getContact(Id contactId) {
        // Perform isAccessible() checks here
        return [SELECT id,LastName FROM Contact WHERE Id =
                :contactId];
    }
    
    
    @AuraEnabled
    public static Account getAccount(Id accountId) {
        // Perform isAccessible() checks here
        return [SELECT Name, BillingCity, BillingState FROM Account WHERE Id =
                :accountId];
    }
    
    @AuraEnabled
    public static Contact saveContactWithAccount(Contact contact, Id accountId) {
        // Perform isAccessible() and isUpdateable() checks here
        contact.AccountId = accountId;
        upsert contact;
        return contact;
    }
}