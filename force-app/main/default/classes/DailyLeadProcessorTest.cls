@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static TestMethod void TestProcess(){
        List<Lead> LeadList=new List<Lead>();
        for(integer i=0;i<200;i++){
            LeadList.add(new lead(LastName='Test'+' '+i,company='Mycompany'));
        }
        insert LeadList;
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        Test.stopTest();
        System.assertEquals(200, [Select count() from lead where LeadSource='Dreamforce']);
    }
}