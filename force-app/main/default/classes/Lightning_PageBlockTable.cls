public class Lightning_PageBlockTable {
    
    @Auraenabled
    public static AccountPagerWrapper fetchAccount(Decimal pageNumber ,Integer recordToDisply) {
        Integer pageSize = recordToDisply;
        Integer offset = ((Integer)pageNumber - 1) * pageSize;
        
        // create a instance of wrapper class.
        AccountPagerWrapper obj =  new AccountPagerWrapper();
        // set the pageSize,Page(Number), total records and accounts List(using OFFSET)   
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() FROM contact];
        obj.contacts = [SELECT ID,FirstName,Phone,LastName FROM contact ORDER BY FirstName LIMIT :recordToDisply OFFSET :offset];
        // return the wrapper class instance .
        return obj;
    }
    
    @Auraenabled
    public static List<contact> delteAccountById(String accid)
    {
        System.debug('In controller delteAccountById method..');
        Contact delcontact=[Select Id from contact where id=:accid];
        try{
            delete delcontact;
            system.debug('massege123 ');
        }
        catch(exception e){
            system.debug('massege '+e.getMessage());
        }
        return [Select ID,FirstName,Phone,LastName FROM contact ORDER BY CREATEDDATE DESC LIMIT 10];
    }
    
    @Auraenabled
    public static list<Contact> sortAccount(String sortField, boolean isAsc) {
        String sSoql = 'SELECT ID,FirstName,Phone,LastName ';
        sSoql += 'FROM Contact';
        system.debug('sortField-->' + sortField);
        
        if (sortField != '') {
            sSoql += ' order by ' + sortField;
            
            // if isAsc is equal tp ture then set 'asc' order otherwise set 'desc' order.
            if (isAsc) {
                sSoql += ' asc';
            } else {
                sSoql += ' desc';
            }
        }
        // set record limit to query 
        sSoql += ' LIMIT 20';
        
        System.debug('@Developer -->sSoql:' + sSoql);
        list <contact> lstResult;
        try {
            system.debug('The query is' + sSoql);
            lstResult = Database.query(sSoql);
            List < contact > returnConList = new List < contact > ();
            
            for (contact a: lstResult) {
                returnConList.add(a);
            }
            return returnConList;
        } 
        catch (Exception ex) {
            // for handle Exception
            return null;
        }
    }
    public class AccountPagerWrapper {
        @AuraEnabled public Integer pageSize {get;set;}
        @AuraEnabled public Integer page {get;set;}
        @AuraEnabled public Integer total {get;set;}
        @AuraEnabled public List<contact> contacts {get;set;}
    }
}