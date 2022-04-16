({
    handleSaveRecord: function(cmp, event, helper) {
        var recId = '';
        cmp.find("recordEditor").saveRecord($A.getCallback(function(result) {
            var resultsToast = $A.get("e.force:showToast");
            if (result.state === "SUCCESS") {
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                 console.log('tanzil'+result);
                resultsToast.fire(); 
                console.log('2');
                 recId = result.recordId;
                helper.navigateTo(cmp,recId)
            } else if (result.state === "ERROR") {
                console.log('Error: ' + JSON.stringify(result.error));
                resultsToast.setParams({
                    "title": "Error",
                    "message": "There was an error saving the record : Please fill up the mandatory fields. " + JSON.stringify(result.error)
                });
                resultsToast.fire();
            } 
        }));
        
    },
    cancelling: function(cmp, event, helper) {
         var recTempId = component.get("v.recordId");
        helper.navigateTo(cmp,recId)
    }
})