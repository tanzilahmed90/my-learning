({
	handleClick : function(component, event, helper) {
        var action=component.get("c.getAccount");
        action.setParams({
            "keyValue":component.get("v.Keywords")
        });
        action.setCallback(this, function(response) {
            var result = response.getReturnValue();
            
            component.set("v.AccountList", result);
            var res=component.get("v.AccountList");
            console.log('result  '+JSON.stringify(res));
            
	});
        $A.enqueueAction(action);    
    }                
})