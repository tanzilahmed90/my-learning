public class UpdateAccountPC {
    public static void UpdatePC(List<Contact> newCon){
        set<id> accId=new set<id>();
        set<id> conId=new set<id>();
        for(contact c:newCon){
            if(c.Primary_contact__c==true){
            accId.add(c.accountId);
            conId.add(c.Id);    
            }
        }
        
        List<contact> conList=[select id,primary_contact__c from contact where id NOT IN :conId AND AccountId IN :accId ];
        for(contact c:conList){
            if(conList.size()>0){
            c.Primary_contact__c=false;
        }
        }
        update conList;
        
        List<Account> acc=[select id,primary_contact__c,(select id,primary_contact__c from contacts) from account where Id IN :accId];
        for(account a:acc){
            for(contact c:a.contacts){
                if(c.Primary_contact__c==true){
                    a.Primary_contact__c=c.Id;
                }
            }
        }
        update acc;
    }
   
}