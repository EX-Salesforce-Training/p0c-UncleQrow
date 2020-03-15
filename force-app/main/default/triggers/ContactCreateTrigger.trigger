trigger ContactCreateTrigger on Contact (before insert) {
    TryToSetParentAccount.setParentAccount(trigger.new);
}