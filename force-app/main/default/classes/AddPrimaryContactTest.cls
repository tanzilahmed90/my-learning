@isTest
public class AddPrimaryContactTest {
 
@testSetup 
    static void setup() {
            List<Account> AccList=TestDataFactory.createAccountsWithConts(2,2);

        List<contact> co=new List<contact>();
        for(integer i=0;i<2;i++){
           co.add(new contact(Lastname='qwerty'+i,accountId=AccList[i].id )); 
        }
        
        insert co;
        
        
    }
    static testmethod void testQueueable() {
         String st='Haryana'; 
        contact con=[select id,lastName from contact limit 1];
        AddPrimaryContact Apc=new AddPrimaryContact(con,st);
        Test.startTest();        
        System.enqueueJob(Apc);
        Test.stopTest();
        system.assertEquals(2, [Select count() from account where BillingState='haryana']);
    }
}