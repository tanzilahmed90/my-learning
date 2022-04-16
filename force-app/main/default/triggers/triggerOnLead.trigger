trigger triggerOnLead on Lead (before insert,before update) {
    Map<id,Lead> LeadMap=new Map<id,Lead>(trigger.new);
    set<string> phoneSet=new set<string>();
    set<string> emailSet=new set<string>();
    for(Lead l:trigger.new){
        phoneSet.add(l.Phone);
        emailSet.add(l.Email);
    }
    List<contact> ConList=new List<contact>();
    ConList=[Select id, phone , email from contact where phone IN : phoneSet AND Email IN : emailSet];
    for(Lead ll:trigger.new){
        if(ConList.size()>0){
            for(contact c:ConList){
                if(ll.Email==c.email && ll.Phone==c.Phone){
                    ll.Contact__c=c.Id;
                }
            }
        }
    }
}