@isTest
public class AccountUtilsTest {
@testSetup static void createAccountsTest() {
    List<Account> AccList=TestDataFactory.createAccountsWithConts(2,2);
}
    static testMethod void accountsByStateTest(){
        List<Account> ListAcc=AccountUtils.accountsByState('Haryana');
        system.assertEquals( ListAcc[0].BillingState,'Haryana');
    }
}