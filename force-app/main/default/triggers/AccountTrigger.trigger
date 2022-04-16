trigger AccountTrigger on Account (before insert,before update, before delete,After insert, After update, After delete, After undelete) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.CreateAccounts(Trigger.new);
        }
        else if(Trigger.isUpdate){
            
        }
        else{
            
        }
    }
    else{
        if(Trigger.isInsert){
            
        }
        else if(Trigger.isUpdate){
            
        }
        else if(Trigger.isDelete){
            
        }
        else{
            
        }
    }
}