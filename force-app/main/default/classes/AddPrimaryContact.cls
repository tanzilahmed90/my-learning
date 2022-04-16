public class AddPrimaryContact implements queueable {
    string St;
    contact co;
    public AddPrimaryContact(contact a,String s){
        this.co=a;
        this.st=s;
    }
    public void execute(QueueableContext context) {
        List<account> acList=[Select id,BillingState From account where BillingState=:st Limit 200];
        for(account str:acList){
            Contact clonedContact = co.clone(false);
            insert clonedContact;
            clonedContact.AccountId=str.id;
            update clonedContact;
            
        }
    }
}