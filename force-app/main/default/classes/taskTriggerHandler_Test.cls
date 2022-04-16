@isTest
public class taskTriggerHandler_Test {
    @TestSetup static void createTaskData() {
        Account acct = new Account(Name='Test Account');
        insert acct;
        List<Opportunity> opp = new List<Opportunity>{
            	new Opportunity(Name=acct.Name + ' Opportunity',
                            	StageName='1 Month',Opportunity_Size__c = '< 25M',
                            	CloseDate=System.today().addMonths(1), AccountId=acct.Id),
                new Opportunity(Name=acct.Name + ' Opportunity1',
                                StageName='3 Months',Opportunity_Size__c = '> 25M',
                                CloseDate=System.today().addMonths(1), AccountId=acct.Id),
                new Opportunity(Name=acct.Name + ' Opportunity2',
                                StageName='6 Months',Opportunity_Size__c = '< 25M',
                                CloseDate=System.today().addMonths(2), AccountId=acct.Id),
                new Opportunity(Name=acct.Name + ' Opportunity3',
                                StageName='3 Months',Opportunity_Size__c = '< 25M',
                                CloseDate=System.today().addMonths(2), AccountId=acct.Id)};
                insert opp;
        
        List<contact> conList=new List<contact>();
        for(integer i = 0; i <= 10; i++){ 
            contact c=new contact();
            c.lastName='Test'+i;
            conList.add(c);
        }
        insert conList;
        
        List<OpportunityContactRole> rolesData=new List<OpportunityContactRole>{
            new OpportunityContactRole(opportunityId=opp[0].id,contactId=conList[0].id),
                new OpportunityContactRole(opportunityId=opp[1].id,contactId=conList[1].id),
                new OpportunityContactRole(opportunityId=opp[2].id,contactId=conList[2].id),
                new OpportunityContactRole(opportunityId=opp[3].id,contactId=conList[3].id)};
                    insert rolesData;
        
        List<Task> tasks = new List<Task>();
        for(Integer i = 0; i <= 10; i++) 
        {
            Task t = new Task(Subject='Task'+i,Status='New',Priority='Normal',whoId=conList[i].id);
            tasks.add(t);
        }
        
        insert Tasks;
        
        List<Event> Events = new List<Event>();
        for(Integer i = 0; i <= 10; i++) 
        {
            Event e = new Event(Subject='Meeting',whoId=conList[i].id,StartDateTime=system.now()+(1/24),EndDateTime=system.now()+(2/24));
            Events.add(e);
        }
        
        insert Events;        
        
        System.assertEquals(11,Tasks.Size());
        System.assertEquals(11,Events.Size());
    }
    
    @isTest static void updateTaskData() {
        List<Task> tasks=[Select id,WhoId,Subject from Task where subject='Task1' OR subject='Task6' OR subject='Task7'];
        Id theId;
        for(task s:tasks){
            if(s.subject=='Task1'){
                theId=s.WhoId;
            }
        }
        if(theId != null){
            for(task tas:tasks){
                if(theId != null)
                    tas.WhoId=theId;
            }
        }
        Test.startTest();
        update tasks;
        Test.stopTest();
        
        System.assertEquals(3,tasks.size());
    }
    
    @isTest static void updateEventData() {
        List<Event> Events=[Select id,WhoId,Subject from Event where subject='Meeting' Limit 3];
        Id theId=Events[0].whoId;
        
        if(theId != null){
            for(Event e:Events){
                if(theId != null)
                    e.WhoId=theId;
            }
        }
        Test.startTest();
        update Events;
        Test.stopTest();
        
        System.assertEquals(3,Events.size());
    }
}