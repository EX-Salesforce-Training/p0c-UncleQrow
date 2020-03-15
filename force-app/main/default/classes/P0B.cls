/////////////////////////////////////////////
//
//Name:Project 0 Bravo
//Author:matthew.trovillo@yahoo.com
//Date:2/25/2020
//Description: Series of apex method to demonstrate
//basic understanding of coding concepts
public class P0B {
    public static Integer nFibonacci(Integer n){
        integer f0 = 0;
        integer f1 = 1;
        if(n == 0){
            return f0;
        }
        else if(n == 1){
            return f1;
        }
        else{
            integer ff = 0;
            for (integer i = 2; i < n+1; i++){
                ff = f0 + f1;
                f0 = f1;
                f1 = ff;
            }
            return ff;
        }
    }
    public static Integer[] sortArray(Integer[] intList){
        integer length = intList.size();
        for(integer n = 1; n < length; ++n){
            integer current = intList[n];
            integer i = n - 1;
            
            while(i >= 0 && intList[i] > current){
                intList[i+1] = intList[i];
                i -= 1;
            }
            intList[i+1] = current;
        }
        return intList;
    }
    public static integer nFactorial(Integer n){
        integer answer = 1;
        if(n == 0 || n == 1){
            return answer;
        }
        else{
            for(integer i = 2; i <= n; i++){
               answer = answer*i; 
            }
            return answer;
        }
    }
    
    public static Integer[] rotateLeftNTimes( Integer[] items, Integer n){
        integer length = items.size();
        for (integer i = 0; i < n; i++){
            integer saved = items[0];
            for(integer p = 0; p < length-1; p++){
                items[p] = items[p+1];
            }
            items[length-1] = saved;
        }
        return items;
    }
    
    public static Boolean bracketsAreBalanced( String s){
        if(s.containsOnly('({[') || s.containsOnly(')}]') || String.isEmpty(s)){
            return false;
        }
        s.deleteWhitespace();
        Integer checkLength = s.length();
        List<String> letterList = s.split('');
        List<String> listStack = new List<string>();
        for(String bracket:letterList){
            switch on bracket{
                when '('{listStack.add('(');}
                when '{'{listStack.add('{');}
                when '['{listStack.add('[');}
                when ')'{
                    integer length = listStack.size();
                    if(length == 0 || listStack.get(length-1) != '('){
                        return false;
                    }
                    else{
                        listStack.remove(length-1);
                    }
                }
                when '}'{
                    integer length = listStack.size();
                    if(length == 0 || listStack.get(length-1) != '{'){
                        return false;
                    }
                    else{
                        listStack.remove(length-1);
                    }
                }
                when ']'{
                    integer length = listStack.size();
                    if(length == 0 || listStack.get(length-1) != '['){
                        return false;
                    }
                    else{
                        listStack.remove(length-1);
                    }
                }
               }
            }
        if(listStack.isEmpty())
        {
            return true;
        }
        else{
            return false;
        }
   }
    public static void updateAccountSize(){
        List<Account> accs = [SELECT Name, NumberOfEmployees, Size__c FROM Account];
        for(Account acc : accs){
            if (acc.NumberofEmployees >= 1 && acc.NumberofEmployees <= 1000){
                acc.Size__c = 'small';
                update acc;
            }
            else if (acc.NumberofEmployees >= 1001 && acc.numberofEmployees <= 10000){
                acc.Size__c = 'medium';
                update acc;
            }
            else if(acc.NumberofEmployees >= 10001){
                acc.Size__c = 'large';
                update acc;
            }
        }
    }
    public static void updateCALeads(){
        List<Lead> leads = [SELECT Status, Description FROM Lead WHERE State = 'CA'];
        for(Lead item: leads){
            item.Status = 'Closed - Not Converted';
            item.Description = 'We are no longer doing business in California';
            update item;
        }
    }
    public static void closePastDueOpportunities(){
        Date currentDate = date.today();
        List<Opportunity> Opps = [SELECT CloseDate, StageName FROM Opportunity WHERE CloseDate <: currentDate AND StageName != 'Closed Won'];
        for(Opportunity opp: Opps){
            opp.StageName = 'Closed Lost';
            update opp;
        }
    }
}