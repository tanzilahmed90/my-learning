trigger CheckEmployee on Account (before insert) {
    for(Account a:Trigger.new){
        if(a.NumberOfEmployees==100){
            a.addError('canot insert 100');
        }
    }
}