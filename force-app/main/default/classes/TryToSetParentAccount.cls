public class TryToSetParentAccount {
    public static void setParentAccount(List<Contact> newContacts){
        for(Contact cont: newContacts){
            if(cont.AccountId == null){
                Account[] parentAccs = [SELECT Name, AccountNumber, (SELECT Id FROM Account.Contacts) FROM Account WHERE Name =:  cont.LastName  
                                     OR( ShippingCity =: cont.MailingCity AND ShippingStreet =: cont.MailingStreet AND 
                                         ShippingCountry =: cont.MailingCountry AND ShippingPostalCode =: cont.MailingPostalCode 
                                         AND ShippingState =: cont.MailingState ) LIMIT 1];
                if(parentAccs.size() > 0){
                	if(parentAccs[0] != null && parentAccs[0].Contacts.size() == 0){
                    	cont.AccountId = parentAccs[0].Id;
                    }
                }
        	}
        }
    }
}