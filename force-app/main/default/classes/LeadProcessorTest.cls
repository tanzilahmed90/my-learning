@isTest
public class LeadProcessorTest {
@testSetup 
    static void setup() {
        List<lead> ld=new List<lead>();
        for(integer i=0;i<200;i++){
            ld.add(new lead(lastname='abc'+i,company='xyz'+i));
        }
        insert ld;
    }
    public static testMethod void method(){
        Test.startTest();
        LeadProcessor Lp=new LeadProcessor();
        id batchId = Database.executeBatch(lp);
        Test.stopTest();
        system.assertEquals(200, [select count() from lead where leadSource='Dreamforce']);
    }
}