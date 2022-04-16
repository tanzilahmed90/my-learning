public class CountRelatedObj1 {
    public List<AggregateResult> getAccList(){
       /*List<AggregateResult> AccList=new List<AggregateResult>();
for (AggregateResult ar : [SELECT Account.Name  , Count(id) ContactCount  
                               FROM Contact GROUP BY Account.Name  Limit 5]){ 

 
        Account a = new Account(); 
        a.name = (string) ar.get('Name'); 
        a.Number_of_Contacts__c = (Integer) ar.get('ContactCount'); 
        AccList.add(a); 
    } */
       List<AggregateResult> AccList= [SELECT Account.Name thename , Count(id) ContactCount  
                               FROM Contact GROUP BY Account.Name  Limit 5];
    return AccList;
    }
}