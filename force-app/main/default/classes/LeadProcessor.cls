global class LeadProcessor implements database.Batchable<sObject>{
    global Database.QueryLocator  start(Database.BatchableContext bc) {
        return Database.getQueryLocator('Select id,leadSource from Lead');
    }
    global void execute(Database.BatchableContext bc, List<lead> records){
        for(lead l:records){
            l.LeadSource='Dreamforce';
        }
        update records;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}