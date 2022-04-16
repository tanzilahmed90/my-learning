trigger TriggerOnTask on Task (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            TaskTriggerHandler.taskUpdate(Trigger.new);
        }
    }							
}