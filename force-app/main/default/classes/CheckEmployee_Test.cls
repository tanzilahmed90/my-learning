@isTest
public class CheckEmployee_Test {
    public Testmethod static void newMethod(){
        List<Account> accl=new List<Account>();
        accl.add(new account(name='Name1',NumberOfEmployees=111));
        accl.add(new account(name='Name11',NumberOfEmployees=111));
        
        accl.add(new account(name='Name2',NumberOfEmployees=100));
        
        accl.add(new account(name='Name3',NumberOfEmployees=111));
        
        accl.add(new account(name='Name4',NumberOfEmployees=111));
        
        accl.add(new account(name='Name5',NumberOfEmployees=100));
        
        accl.add(new account(name='Name6',NumberOfEmployees=111));
        accl.add(new account(name='Name7',NumberOfEmployees=111));
        
        accl.add(new account(name='Name8',NumberOfEmployees=111));
        
        accl.add(new account(name='Name9',NumberOfEmployees=111));
        
        accl.add(new account(name='Name10',NumberOfEmployees=100));
        integer count=0;
        integer count1=0;
        
        database.saveresult[] ds =  Database.insert(accl,false);
        for(database.SaveResult d : ds){
            if(d.issuccess()){
                count++;
            }
            else
                count1++;
        }
		system.assertEquals(8, count);
system.assertEquals(3, count1);        
    }   
}