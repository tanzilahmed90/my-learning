@isTest
public class AccountsControllerTest {
@testSetup static void createAccountsTest() {
    List<Account> AccList=TestDataFactory.createAccountsWithConts(2,2);
}
    static testMethod void getAccountsTest(){
        List<Account> ListAcc=AccountsController.getAccounts();
        system.assertEquals( ListAcc.size(),2);
    }
}