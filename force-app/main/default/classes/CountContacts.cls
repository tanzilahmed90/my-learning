public class CountContacts {
    public static void UpdateContactNumber(List<contact> Conlist){
        set<id> accId=new set<id>();
        for(contact c:conList){
            accId.add(c.accountId);
        }
        List<account> AccList=[select id, No_of_contacts__c, (Select id from contacts) from account where id in : accId];
        for(account a:AccList){
            a.No_of_contacts__c=a.contacts.size();
        }
        update AccList;
    }
}