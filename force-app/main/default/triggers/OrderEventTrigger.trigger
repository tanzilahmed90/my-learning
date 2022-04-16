trigger OrderEventTrigger on Order_Event__e (after insert) {
    
    // Trigger for listening to Cloud_News events.
    
    // List to hold all cases to be created.
    List<Task> Tasks = new List<Task>();
    
    // Get queue Id for case owner
    
    
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task t = new Task();
            t.Priority= 'Medium';
            t.Subject= 'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId= event.CreatedById;
           
            Tasks.add(t);
        }
    }
    
    // Insert all cases corresponding to events received.
    insert Tasks;
    
}