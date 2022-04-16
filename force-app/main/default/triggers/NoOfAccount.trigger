trigger NoOfAccount on Contact (after insert, after delete, after undelete) {
    /*Set<id>  aId=new set<id>();
    if(Trigger.isInsert || Trigger.isInsert){
        for(Contact c:trigger.new){
            aId.add(c.AccountId);
        }
    }
    else{
        for(Contact c:trigger.old){
            aId.add(c.AccountId);
        }
    }
    
    List<Account> Acc=[Select id, name,Number_of_Contacts__c,(Select name from contacts) from Account where id in : aId];
    
    for(Account a:acc){
        for(contact c:a.contacts){
            a.Number_of_Contacts__c=a.contacts.size(); 
        }
    }
    update Acc;*/
    
}