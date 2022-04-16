@isTest
public class  AccountProcessorTest {
 @IsTest private static void testCount() {
     List<account> NewList=new List<account>();
     NewList.add(new account(name='abc',Number_of_Contacts__c=0));
     NewList.add(new account(name='xyz',Number_of_Contacts__c=0));
     insert NewList;
     List<contact> NewContacts=new List<contact>{new contact(lastName='new1',accountId=NewList[0].id),new contact(lastName='new12',accountId=NewList[1].id)};
         insert NewContacts;
     List<id> IdList=new List<id>{NewList[0].id,NewList[1].id};
         Test.startTest();  
     AccountProcessor.countContacts(IdList);
     Test.stopTest();
 }
    
}