({
	getAccounts: function(component, page, recordToDisply) {
 
      // create a server side action. 
      var action = component.get("c.fetchAccount");
      // set the parameters to method 
      action.setParams({
         "pageNumber": page,
         "recordToDisply": recordToDisply
      });
      // set a call back   
      action.setCallback(this, function(a) {
         // store the response return value (wrapper class insatance)  
         var result = a.getReturnValue();
         console.log('result ---->' + JSON.stringify(result));
         // set the component attributes value with wrapper class properties.   
 
         component.set("v.contacts", result.contacts);
         component.set("v.page", result.page);
         component.set("v.total", result.total);
         component.set("v.pages", Math.ceil(result.total / recordToDisply));
 
      });
      // enqueue the action 
      $A.enqueueAction(action);
   },
    
    deleteAccount : function(component, event) {
        console.log('in delete account helper method.');
        var action = component.get("c.delteAccountById");
        action.setParams({accid:event.target.id});
        action.setCallback(this, function(response) {
        	component.set("v.contacts",response.getReturnValue());
        });
        $A.enqueueAction(action);
	},
    
    onLoad: function(component, event, sortField) {
      //call apex class method
      var action = component.get("c.sortAccount");
 
      // pass the apex method parameters to action 
      action.setParams({
         'sortField': sortField,
         'isAsc': component.get("v.isAsc")
      });
      action.setCallback(this, function(response) {
         //store state of response
         var state = response.getState();
         if (state === "SUCCESS") {
            //set response value in ListOfContact attribute on component.
            component.set('v.contacts', response.getReturnValue());
         }
      });
      $A.enqueueAction(action);
   },
 
   sortHelper: function(component, event, sortFieldName) {
      var currentDir = component.get("v.arrowDirection");
 
      if (currentDir == 'arrowdown') {
         // set the arrowDirection attribute for conditionally rendred arrow sign  
         component.set("v.arrowDirection", 'arrowup');
         // set the isAsc flag to true for sort in Assending order.  
         component.set("v.isAsc", true);
      } else {
         component.set("v.arrowDirection", 'arrowdown');
         component.set("v.isAsc", false);
      }
      // call the onLoad function for call server side method with pass sortFieldName 
      this.onLoad(component, event, sortFieldName);
   },
})