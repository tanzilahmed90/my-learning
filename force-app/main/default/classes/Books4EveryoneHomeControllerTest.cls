@isTest
public class Books4EveryoneHomeControllerTest {
    static testMethod void BooksMethodTest(){
        Author__c Auther=new Author__c(Name='APJ');
        insert auther;
        Book__c MyBook= new Book__c(Name='Wings Of Fire', Description__c='APJ',Author__c=auther.id);
        insert myBook;
        Recommendation__c Rec= new Recommendation__c( Review__c='Any', Rating__c='4',Book__c=myBook.id);
        List<Book__c> BookList1=Books4EveryoneHomeController.getBooks();
        List<Recommendation__c> BookList2=Books4EveryoneHomeController.getBookRecommendations();
        List<Book__c> BookList3=Books4EveryoneHomeController.getBooksAndAuthor();
        List<Book__c> BookList4=Books4EveryoneHomeController.getBooksWithoutAuthors();
    }
}