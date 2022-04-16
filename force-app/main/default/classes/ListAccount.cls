public class ListAccount {
    @AuraEnabled
    public static List<Account> allAccounts() {
        return  [Select Id,Phone,industry, Name from Account ];
        
    }      
}