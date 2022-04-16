trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
   List<BatchLeadConvertErrors__c> ErrorList=new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent c:trigger.new){
        BatchLeadConvertErrors__c Error4List=new BatchLeadConvertErrors__c();
        Error4List.AsyncApexJobId__c=c.AsyncApexJobId ;
        Error4List.Records__c=c.JobScope ;
        Error4List.StackTrace__c=c.StackTrace ;
        ErrorList.add(Error4List);
        
    }
    insert ErrorList;
}