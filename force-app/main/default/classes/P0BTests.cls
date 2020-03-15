@IsTest
public class P0BTests {
    
    @IsTest
    public static void testFibonacci(){
        
        integer result = P0B.nFibonacci(0);
        system.assertEquals(0, result);
        result = P0B.nFibonacci(1);
        system.assertEquals(1, result);
        result = P0B.nFibonacci(2);
        system.assertEquals(1, result);
        result = P0B.nFibonacci(10);
        system.assertEquals(55, result);
    }
    
    @IsTest
    public static void testSort(){
        
        List<integer> input = new List<integer>{2,4,5,1,3,1};
        List<integer> output = new List<integer>{1,1,2,3,4,5};
        List<integer> result = P0B.sortArray(input);
        system.assertEquals(output, result);
        input = new List<integer>{5,4,3,2,1};
        output = new List<integer>{1,2,3,4,5};
        result = P0B.sortArray(input);
        system.assertEquals(output, result);
    }
    
    @IsTest
    public static void testFactorial(){
        integer result = P0B.nFactorial(0);
        system.assertEquals(1, result);
        result = P0B.nFactorial(1);
        system.assertEquals(1, result);
        result = P0B.nFactorial(3);
        system.assertEquals(6, result);
    }
    
    @IsTest
    public static void testRotateLeft(){
        List<integer> input = new List<integer>{1,2,3,4,5};
        List<integer> output = new List<integer>{2,3,4,5,1};
        List<integer> result = P0B.rotateLeftNTimes(input, 1);
        system.assertEquals(output, result);
        input = new List<integer>{1,2,3,4,5};
        result = P0B.rotateLeftNTimes(input, 6);
        system.assertEquals(output, result);
        input = new List<integer>{1,2,3,4,5};
        output = new List<integer>{4,5,1,2,3};
        result = P0B.rotateLeftNTimes(input, 3);
        system.assertEquals(output, result);
    }
    
    @IsTest
    public static void testBalancedBrackets(){
        String Input = '( )';
        Boolean result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(true, result);
        Input = '( ) ( )';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(true, result);
        Input = '( ( ) )';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(true, result);
        Input = '( { [ ] } )';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(true, result);
        Input = '(';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(false, result);
        Input = ')';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(false, result);
        Input = '( ( )';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(false, result);
        Input = '( [ ) ]';
        result = P0B.bracketsAreBalanced(Input);
        system.assertEquals(false, result);
    }
    @IsTest
    public static void testUpdateAccountSize(){
        Account a1 = New Account(Name = 'test 1', NumberOfEmployees = 10);
        Account a2 = New Account(Name = 'test 2', NumberOfEmployees = 1010);
        Account a3 = New Account(Name = 'test 3', NumberOfEmployees = 10005);
        test.startTest();
        insert a1;
        insert a2;
        insert a3;
        P0B.updateAccountSize();
        test.stopTest();
        List<Account> testAccounts = [SELECT Name, Size__c FROM Account WHERE Name LIKE 'test _'];
        for(Account acc: testAccounts){
            switch on acc.Name{
                when 'test 1'{ System.assertEquals('small', acc.Size__c);}
            	when 'test 2'{ System.assertEquals('medium', acc.Size__c);}
        		when 'test 3'{ System.assertEquals('large', acc.Size__c);}
            }
        }
    }
    @IsTest
    public static void testUpdateCALeads(){
        Lead L1 = New Lead(LastName = 'bob',Company = 'bobInc', Status = 'Working - Contacted', State = 'CA');
        test.startTest();
        insert L1;
        P0B.updateCALeads();
        test.stopTest();
        Lead tested = [SELECT Status, Description FROM Lead WHERE LastName = 'bob' AND Company = 'bobInc'];
        system.assertEquals('Closed - Not Converted', tested.Status);
        system.assertEquals('We are no longer doing business in California',tested.Description);
        
    }
    @IsTest
    public static void testclosePastOpportunities(){
        Opportunity o1 = New Opportunity(Name = 'bob',CloseDate = Date.newInstance(2020, 3, 1), StageName = 'Needs Analysis');
        test.startTest();
        insert o1;
        P0B.closePastDueOpportunities();
        test.stopTest();
        Opportunity tested = [SELECT StageName FROM Opportunity WHERE Name = 'bob'];
        system.assertEquals('Closed Lost',tested.StageName);
    }
}