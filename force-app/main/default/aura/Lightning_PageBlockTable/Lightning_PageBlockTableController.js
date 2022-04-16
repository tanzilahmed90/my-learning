({
    doInit: function(component, event, helper) {
        // this function call on the component load first time     
        // get the page Number if it's not define, take 1 as default
        var page = component.get("v.page") || 1;
        // get the select option (drop-down) values.   
        //var recordToDisply = component.find("recordSize").get("v.value");
        var recordToDisply = component.get("v.recordSize");
        // call the helper function   
        helper.getAccounts(component, page, recordToDisply);
        
    },
    
    navigate: function(component, event, helper) {
        // this function call on click on the previous page button  
        var page = component.get("v.page") || 1;
        // get the previous button label  
        var direction = event.getSource().get("v.label");
        // get the select option (drop-down) values.  
        var recordToDisply = component.get("v.recordSize");
        // set the current page,(using ternary operator.)  
        page = direction === "Previous Page" ? (page - 1) : (page + 1);
        // call the helper function
        helper.getAccounts(component, page, recordToDisply);
        
    },
    
    onSelectChange: function(component, event, helper) {
        // this function call on the select opetion change,	 
        var page = 1
        var recordToDisply = component.get("v.recordSize");
        helper.getAccounts(component, page, recordToDisply);
    },
    save : function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
        //location.reload();// This will refresh the app to get the latest updated data.        
    },
    edit : function(component, event, helper) {
        component.set("v.isEdit",true);
        console.log('Edit record ID..'+event.target.id);
        component.set("v.editAccId",event.target.id);
    },
    
    cancelform : function(component, event, helper) {
        component.set("v.isEdit",false);
    },
    
    delete : function(component, event, helper) {        
    if(confirm('Are you sure?')){
    //helper.deleteAccount(component, event); 
    var action = component.get("c.delteAccountById");
    action.setParams({accid:event.target.id});
        action.setCallback(this, function(response) {
            component.set("v.contacts",response.getReturnValue());
    });
    $A.enqueueAction(action);  

    var page = component.get("v.page") || 1;
    // get the select option (drop-down) values.   
    var recordToDisply = component.get("v.recordSize");
    // call the helper function   
    helper.getAccounts(component, page, recordToDisply);
        }
    },
        loadContactList: function(component, event, helper) {
       // By Default make sort field is 'FirstName' of contact object
       // call the helper function with pass sortField Name
       helper.onLoad(component, event, 'Name');
    },
 
    sortFirstName: function(component, event, helper) {
       // set current selected header field on selectedTabsoft attribute.     
       component.set("v.selectedTabsoft", 'FirstName');
       // call the helper function with pass sortField Name   
       helper.sortHelper(component, event, 'FirstName');
    },
 
    sortPhone: function(component, event, helper) {
       // set current selected header field on selectedTabsoft attribute.    
       component.set("v.selectedTabsoft", 'Phone');
       // call the helper function with pass sortField Name  
       helper.sortHelper(component, event, 'Phone');
    },
 
    sortLastName: function(component, event, helper) {
       // set current selected header field on selectedTabsoft attribute.        
       component.set("v.selectedTabsoft", 'LastName');
       // call the helper function with pass sortField Name      
       helper.sortHelper(component, event, 'LastName');
    },
})