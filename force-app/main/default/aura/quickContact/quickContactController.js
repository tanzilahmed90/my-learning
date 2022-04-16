({
    doInit : function(component, event, helper) {
        var action=component.get("c.getAccount");
        action.setParams({"accountId": component.get("v.recordId")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){	
                component.set("v.account",response.getReturnValue());
            }
            else {
                console.log('Problem getting account, response state: ' + state);
            }
        });
        $A.enqueueAction(action);
    },
    
    handleSaveContact : function(component, event, helper) {
        var saveContactAction=component.get("c.saveContactWithAccount");
        saveContactAction.setParams({"contact": component.get("v.newContact"),
                                     "accountId": component.get("v.recordId")
                                    });
        saveContactAction.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){	
                $A.get("e.force:closeQuickAction").fire(); 
            }
            else {
                console.log('Problem inserting contact, response state: ' + state);
            }
        });
        $A.enqueueAction(saveContactAction);
        
    },
    
    handleCancel: function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
    }
    
})