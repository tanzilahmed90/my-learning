public class AccountUtils {
public static list<Account> accountsByState(String s){
List<Account> accounts = [SELECT Name,BillingState
  FROM Account WHERE BillingState=:s]; 
Map<String, List<account>> grouped = new Map<String, List<Account>>();
        for (Account record : accounts )
        {
            String key = s;
            if (!grouped.containsKey(key))
                grouped.put(key, new List<SObject>());
            grouped.get(key).add(record);
        }
        
Accounts.clear();
 accounts = grouped.get(s);
return accounts;
}
}