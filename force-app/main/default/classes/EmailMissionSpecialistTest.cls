@isTest
public class EmailMissionSpecialistTest {
    static testMethod void sendMailTest(){
        EmailMissionSpecialist EmailTest=new EmailMissionSpecialist();
        EmailTest.sendMail('tanzilahmed90@gmail.com','Testing','Please confirm');
        //EmailTest.inspectResults(results);
    }


}