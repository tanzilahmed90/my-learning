@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
@HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String AccountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')-18,
          request.requestURI.lastIndexOf('/'));
       
        Account result =  [SELECT name,(select id ,name from contacts)
                        FROM Account
                        WHERE Id = :AccountId];
        return result;
        
    }
}