public class MyAccount {
    @AuraEnabled
    public static Account[] getAccount(String keyValue){
        List<Account> Acc=[Select id, name,Industry,type from Account where name LIKE :('%' + keyValue + '%') Limit 10];
        if(Acc.size()<1){
            
        }
        Return acc;
        
    }
    @AuraEnabled
    public static string checkAccount() {
        throw new AuraHandledException('NSFW name detected.');
        
    }
}