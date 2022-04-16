global class DailyLeadProcessor implements Schedulable {
global void execute(SchedulableContext ctx) {
    List<lead> l=[select id,LeadSource from lead where LeadSource=null Limit 200];
    if(l.size()>0){
        for(Lead ld:l){
            ld.LeadSource='Dreamforce';
        }
        update l;
    }
}
}