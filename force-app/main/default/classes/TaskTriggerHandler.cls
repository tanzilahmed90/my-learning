public class TaskTriggerHandler {
    public static void taskUpdate(List<Task> taskList){
        Map<id,List<Task>> taskMap=new Map<id,List<Task>>();
        for(Task et:taskList){
            if(et.whoId.getSObjectType().getDescribe().getName()=='contact' && et.whoId != null){
                if (taskMap.containsKey(et.whoId)){
                    taskMap.get(et.whoId).add(et);
                }
                else{
                    taskMap.put(et.whoId, new List<Task>{et});
                }
            }
        }
        
        List<OpportunityContactRole> oppRoleList=[Select contactId,Opportunity.isclosed,Opportunity.StageName,Opportunity.Name,Opportunity.Opportunity_Size__c  From OpportunityContactRole where contactId in : taskMap.keySet()];
        Map<id,List<opportunity>> oppMap=new Map<id,List<opportunity>>();
        for(OpportunityContactRole op:oppRoleList){
                if (oppMap.containsKey(op.contactId)){
                    oppMap.get(op.contactId).add(op.Opportunity);
                }
                else{
                    oppMap.put(op.contactId, new List<Opportunity>{op.Opportunity});
                }
            }
        
        
        if(!oppRoleList.isEmpty()){
            for(OpportunityContactRole oc:oppRoleList){
                for(Task t:taskMap.get(oc.ContactId)){
                    if(!oc.Opportunity.isClosed){
                        if(oc.Opportunity.Opportunity_Size__c == '> 25M' && (oc.Opportunity.StageName == '1 Month' || oc.Opportunity.StageName == '3 Months' || oc.Opportunity.StageName == '6 Months'))
                            t.Priority__c='1';
                        else if(oc.Opportunity.Opportunity_Size__c == '< 25M' && oc.Opportunity.StageName == '1 Month')
                            t.Priority__c='2';
                        else if(oc.Opportunity.Opportunity_Size__c == '< 25M' && oc.Opportunity.StageName == '6 Months')
                            t.Priority__c='3';
                        else
                            t.Priority__c='4';
                    }
                    else
                        t.Priority__c='4';
                }
            }
        } 
    }
    
    public static void eventUpdate(List<Event> eventList){
        Map<id,List<Event>> eventMap=new Map<id,List<Event>>();
        for(Event et:eventList){
            if(et.whoId.getSObjectType().getDescribe().getName()=='contact' && et.whoId != null){
                if (eventMap.containsKey(et.whoId)){
                    eventMap.get(et.whoId).add(et);
                }
                else{
                    eventMap.put(et.whoId, new List<Event>{et});
                }
            }
        }
        
        List<OpportunityContactRole> oppRoleList=[Select contactId,Opportunity.StageName,Opportunity.Name,Opportunity.Opportunity_Size__c  From OpportunityContactRole where contactId in : eventMap.keySet() AND Opportunity.isclosed = false];
        
        if(!oppRoleList.isEmpty()){
            for(OpportunityContactRole oc:oppRoleList){
                for(Event e:eventMap.get(oc.ContactId)){
                    if(oc.Opportunity.Opportunity_Size__c == '> 25M' && (oc.Opportunity.StageName == '1 Month' || oc.Opportunity.StageName == '3 Months' || oc.Opportunity.StageName == '6 Months'))
                        e.Priority__c='1';
                    else if(oc.Opportunity.Opportunity_Size__c == '< 25M' && oc.Opportunity.StageName == '1 Month')
                        e.Priority__c='2';
                    else if(oc.Opportunity.Opportunity_Size__c == '< 25M' && oc.Opportunity.StageName == '6 Months')
                        e.Priority__c='3';
                    else
                        e.Priority__c='4';
                }
            }
        } 
    }
}