public class AccountTriggerHandler {
public static void CreateAccounts (List<Account> AList){
//List<Account> Acc=new List<Account>();
for(Account a:AList){
if(a.BillingState!=null){
a.ShippingState=a.BillingState;
}
}

}
}