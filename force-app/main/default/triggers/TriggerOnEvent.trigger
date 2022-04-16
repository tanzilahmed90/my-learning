trigger TriggerOnEvent on Event (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            TaskTriggerHandler.eventUpdate(Trigger.new);
        }
    }							
}