public class search2cartController {

    @AuraEnabled
    public static  List<account> findAll(String searchKey) {
        String key = '%' + searchKey + '%';
        List<accounT> aList = [SELECT id,Name,Industry,Type FROM account 
                      WHERE Name LIKE :key ];
        return aList;
    }
    @AuraEnabled
    public static  List<account> getAll() {
       
        List<accounT> aList = [SELECT id,Name,Industry,Type FROM account Limit 10 ];
        return aList;
    }
}