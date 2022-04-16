@isTest
public class insertAccountTriggerTest {
    static testMethod void InsertAcc(){
        Account ac=new account(Name='TestAccount2');
        insert ac;
        ac.Industry='Education';
        update ac;
        List<Account> KistaCC=ListAccount.allAccounts();
    }

}