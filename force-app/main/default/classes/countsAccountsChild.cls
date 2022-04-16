public class countsAccountsChild {
    Map<String,List<String>> AccMap;
    public Map<String,List<String>> getAccMap(){
        List<Account> targetAccounts = [SELECT Id, Name, (SELECT Id FROM Contacts), (SELECT Id FROM Opportunities) FROM Account order by Name asc];
        AccMap=new Map<String,List<String>>();
        for(Account myAccount :targetAccounts){
            List<String> strL=new List<String>();
            strL.add(myAccount.name);
            strL.add(string.valueOf(myAccount.Contacts.size()));
            strL.add(string.valueOf(myAccount.Opportunities.size()));
            AccMap.put(myAccount.id,strL); 
        }
        return AccMap;
    }
}