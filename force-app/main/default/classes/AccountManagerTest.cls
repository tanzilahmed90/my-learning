@isTest
public class AccountManagerTest {

 @isTest static void testGetAccount() {   
    Account acct = new Account(Name='N Account');
    insert acct;

    ID acctID = acct.ID;
    Contact con = new Contact(
        FirstName='Joe',
        LastName='Smith1',
        Phone='415.555.1211',
        AccountId=acctID);
    insert con;
     RestRequest request = new RestRequest();
       
            request.requestUri =
        'https://mydom2-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+acctID+'/contacts'
        + acctID;
        request.httpMethod = 'GET';
        RestContext.request = request;
Account thisAccount=AccountManager.getAccount();
     System.assert(thisAccount != null);
        System.assertEquals('N Account', thisAccount.Name);
}

}