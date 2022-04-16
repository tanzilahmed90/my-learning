@isTest
public class AccountTriggerTest {
    static testMethod void testecord(){
        integer j=0;
        List<Account> AccList=new List<Account>();
        for(integer i=0; i<200; i++){
            AccList.add(new Account(name='Accoun '+i, BillingState='CA'));
        }
        insert AccList;
        for(Account a:AccList){
            if(a.ShippingState=='CA'){
                j=j+1;
            }
        }
        System.assertEquals(200,j);
    } 
}