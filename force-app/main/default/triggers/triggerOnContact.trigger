trigger triggerOnContact on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            
        }
        else if(trigger.isUpdate){
            
        }
        else{
            
        }
    }
    else{
        if(trigger.isInsert){
            //UpdateAccountPC.UpdatePC(Trigger.new);
            //CountContacts.UpdateContactNumber(Trigger.new);
        }
        else if(trigger.isUpdate){
            UpdateAccountPC.UpdatePC(Trigger.new);
        }
        else if(trigger.isDelete){
            //CountContacts.UpdateContactNumber(Trigger.old);
        }
        else{
          CountContacts.UpdateContactNumber(Trigger.new);
        }
    }
}