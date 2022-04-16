public class MyController { 
    
    public String myString {
        get  { system.debug('1');
            if (myString	== null) {
                myString = 'a ';
                 system.debug('2');
            }
            return myString ;
        } private set ;
    }
    
    public String getMyString (){
        system.debug('3');
        return  'getMyString ';
    }
    
    public String getStringMethod () {
         system.debug('4');
        if (myString	== null) {
            myString = 'b ';
             system.debug('5');
        }
        return myString ;
    }
}