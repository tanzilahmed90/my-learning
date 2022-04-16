trigger openOppCount on Opportunity (after insert,after update) {
   Map<id, List<Opportunity>> OppMap=new Map<id, List<Opportunity>>();
    for(Opportunity o: Trigger.New){
        if(OppMap.keySet().contains(o.AccountId))
           OppMap.get(o.AccountId).add(o); 
        else
            OppMap.put(o.AccountId,new List<Opportunity>{o});  
    }
    
	List<Opportunity> oppList= [Select Id,isClosed from Opportunity Where accountId In : OppMap.keySet() AND isClosed=False ];
}