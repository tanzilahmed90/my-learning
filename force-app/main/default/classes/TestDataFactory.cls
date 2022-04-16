@isTest
public class TestDataFactory {
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }
    
    public static List<Account> createAccountsWithConts(Integer numAccts, Integer numContsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i,industry='education',BillingState='Haryana', Type='business', NumberOfEmployees=2, TickerSymbol='', Phone='3453325');
            accts.add(a);
        }
        insert accts;
        
        List<Contact> Conts = new List<Contact>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numContsPerAcct;k++) {
                Conts.add(new Contact(LastName=acct.Name + ' Contact ' + k,
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert Conts;
        
        return accts;
    }
}