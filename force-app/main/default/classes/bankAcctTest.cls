@isTest
public class bankAcctTest {
    static testmethod void makeDepositTest(){
        BankAcct BnkObj= new BankAcct();
        BnkObj.makeDeposit(500);
        integer Bal=BnkObj.getBalance();
        system.assertEquals(bal,500);
    }
}