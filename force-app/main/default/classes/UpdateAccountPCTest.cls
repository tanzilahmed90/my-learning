@isTest
public class UpdateAccountPCTest {
    Public static testMethod void TestTrigger(){
        List<Account> acList=new List<Account>{new account(Name='TestAccount'),new account(Name='TestAccount1')};
        insert acList;
        List<contact> conList=new List<contact>{new contact(LastName='TestAccount',Primary_contact__c=true,AccountId=acList[0].id),
            									new contact(LastName='TestAccount1',Primary_contact__c=false,AccountId=acList[0].id)};
        Insert conList;
    }
}