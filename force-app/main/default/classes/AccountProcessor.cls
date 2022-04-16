public class AccountProcessor {
    @future
    public static void countContacts(List<Id> recordIds) {
        List<Account> accounts = [Select Id, Name,Number_of_Contacts__c,(select id from contacts) from Account Where Id IN :recordIds];
        List<contact> cont=[select id from contact where accountid IN :recordIds];
        //List<contact> ContListSize=new List<contact>();
        //
        for(account a:accounts){
            if(a.contacts.size()>0){
                
                
                List<contact> ContListSize=a.contacts;
                a.Number_of_Contacts__c=ContListSize.size();
            }
        }
    }
    
}