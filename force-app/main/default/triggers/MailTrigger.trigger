trigger MailTrigger on Mail__c (before update) {
    AutoSetRefundStatus.setRefundStatus(trigger.new);
}