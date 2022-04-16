({
    doInit : function(component, event) {
        var action = component.get("c.allAccounts");
        action.setCallback(this, function(a) {
            component.set("v.Accounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})