({
    
    init: function (cmp, event, helper) {
        cmp.set('v.mycolumns', [
            { label: 'Name', fieldName: 'Name', type: 'text'},
           
            { label: 'Industry', fieldName: 'Industry', type: 'text'},
            { label: 'Type', fieldName: 'Type', type: 'text'}
        ]);

        helper.getData(cmp);   
    
},
    searchAcc : function(component, event, helper) {
        
        var action = component.get("c.findAll");
        
        // pass the apex method parameters to action 
        action.setParams({
            'searchKey': component.get("v.searchStr")
        });
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                //set response value in ListOfContact attribute on component.
                component.set('v.accList', response.getReturnValue());
                
            }
        });
         $A.enqueueAction(action); 
    },
    getSelectedName: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        // Display that fieldName of the selected rows
        if(selectedRows.length > 0){
           cmp.set('v.isAct', false); 
        }
        else
        {
           cmp.set('v.isAct', true); 
        }
         var setRows = [];
        for ( var i = 0; i < selectedRows.length; i++ ) {
            
            setRows.push(selectedRows[i]);

        }
        cmp.set("v.selectedAccts", setRows);
       // for (var i = 0; i < selectedRows.length; i++){
           // alert("You selected: " + selectedRows[i].Name);
       // }
    },
    addToCart: function (cmp, event) {
        var alist = cmp.get("v.selectedAccts");
        var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": alist.length+" records has been added to cart.",
        "mode":"dismissible",
        "type":"info"
    });
    toastEvent.fire();

        
    }
}
)