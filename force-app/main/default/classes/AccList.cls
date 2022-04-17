public class AccList {
  Public AccList(ApexPages.StandardController controller){
        
    }
  List<Account> AcList;
    public List<Account> getAcList(){
        AcList=[Select id ,Name ,industry,Type from account limit 10];
        return AcList; 
    }
}