({
    handleSubmit: function (component, event, helper) {
        component.set("v.parentRec", event.getParam("id"));
        component.set("v.viewform", false);
        component.set("v.isOpen", true);
        component.find('notifLib').showToast({
            "title": "Account created!",
            "message": "The record has been created successfully.",
            "variant": "success"
        });
    },
    
    handleLoad: function (component, event, helper) {
        /* var record = event.getParam('record');
        if(record !== undefined && !record.fields.FirstName.value){
            
            // I did not test if setting both value and displayValue attributes are required
            var abc=component.get("v.parentRec");
            console.log(abc);
            record.fields.AccountId.value = component.get("v.parentRec");
            record.fields.AccountId.displayValue = component.get("v.parentRec");
            //component.set("v.ContactFields.AccountId",component.get("v.parentRec"));
            console.log('load called');
        }*/
    },
    
    handleSubmit2 : function(component, event, helper) {
        event.preventDefault();
        var fields = event.getParam("fields");
        fields["AccountId"] = component.get("v.parentRec");
        component.find("recordViewForm1").submit(fields);
        
    }, 
    
     handleSuccess : function(component, event, helper) {
        
        component.set("v.isOpen", false);
        component.find('notifLib').showToast({
            "title": "Contact created!",
            "message": "The record has been created successfully.",
            "variant": "success"
        });
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.parentRec"),
            "slideDevName": "related"
        });
        navEvt.fire();
    },
    
    onCancel: function (component, event, helper) {
        component.set("v.viewform", false);
        var homeEvent = $A.get("e.force:navigateToObjectHome");
        homeEvent.setParams({
            "scope": "Account"
        });
        homeEvent.fire();
    },
    
    onCancel1: function (component, event, helper) {
        component.set("v.isOpen", false);
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.parentRec"),
            "slideDevName": "related"
        });
        navEvt.fire();
    },
    
    handleError: function (cmp, event, helper) {
        cmp.find('notifLib').showToast({
            "title": "Please fill mandatory fields!",
            "message": event.getParam("message"),
            "variant": "error"
        });
    }
})