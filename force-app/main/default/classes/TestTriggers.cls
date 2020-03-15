@isTest
public class TestTriggers {
    
    @isTest
    public static void testAutoSetRefundStatus(){
        //create this so that we only have to deal with the trigger on mail, not the contact trigger
        Account holder = new Account(Name = 'bob');
        insert holder;
        holder = [SELECT Id FROM Account WHERE Name = 'bob'];
        
        //need to insert and grab so that we generate an Id for contact and address to be used for testm
        Contact testc = new Contact(LastName = 'tester', AccountId = holder.Id);
        Adress__c testa = new Adress__c(Name = '1101 boolean drive', Zip_Code__c = '98597');
        insert testc;
        insert testa;
        testc = [SELECT Id FROM Contact WHERE LastName = 'tester'];
        testa = [SELECT Id FROM Adress__c WHERE Name = '1101 boolean drive'];
        
        //now we can do this
        Mail__c testm = new Mail__c(Height__c = 5, Weight__c = 5, Deliver_To__c = testc.Id, 
                               Mailing_Address__c = testa.Id, Inusrance__c = 200);
        
        
        insert testm;
        Test.startTest();
        Mail__c testm2 = [SELECT Delivery_Status__c FROM Mail__c WHERE Height__c = 5];
        testm2.Delivery_Status__c='Missing';
        update testm2;
        Test.stopTest();
        Mail__c resultm = [SELECT Refund_Status__c FROM Mail__c WHERE Height__c= 5];
        System.assertEquals('Waiting for Approval', resultm.Refund_Status__c);
        
        
    }
    @isTest
    public static void testContactCreateTrigger(){
        Contact testC = new Contact(LastName = 'burger');
        Account testA = new Account(Name = 'burger');
        
        insert testA;
        testA = [SELECT Id FROM Account WHERE Name = 'burger'];
        
        test.startTest();
        insert testC;
        test.stopTest();
        
         Contact resultC = [SELECT AccountId FROM Contact WHERE LastName = 'burger'];
        system.assertEquals(testA.Id, resultC.AccountId);
        
    }
}