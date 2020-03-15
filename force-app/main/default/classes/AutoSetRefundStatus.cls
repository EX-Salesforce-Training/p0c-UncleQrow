public class AutoSetRefundStatus {
    public static void setRefundStatus(List<Mail__c> updatedContacts){
        for(Mail__c item: updatedContacts){
        if(item.Delivery_Status__c == 'Missing'){
            if(item.Inusrance__c > 100){
            	item.Refund_Status__c= 'Waiting for Approval';
            }
        }
    }
    }
}