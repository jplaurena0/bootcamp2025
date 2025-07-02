public class ContactTriggerHandler {

    public static void afterInsertHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
            for (Contact con : newContacts){
               if(String.isNotBlank(con.Accountid)){
                accountIds.add(con.AccountId);
                String accountId = con.AccountId;
                }
            }
        AccountContactService.updateActiveContacts(accountIds);
    }

    public static void afterUpdateHandler(List<Contact> newContacts, Map<Id, Contact> oldContactsMap) {
        Set<Id> accountIds = new Set<Id>();
            for (Contact con : newContacts){
               if(String.isNotBlank(con.Accountid) && con.Active__c != oldContactsMap.get(con.Id).Active__c && con.Active__c == false){
                accountIds.add(con.AccountId);
                String accountId = con.AccountId;
                } else if(oldContactsMap.get(con.Id).AccountId != con.AccountId && String.isNotBlank(con.AccountId)){
                    accountIds.add(con.AccountId);
                    accountIds.add(oldContactsMap.get(con.Id).AccountId);
            }
        AccountContactService.updateActiveContacts(accountIds);
        }
    }

    public static void afterDeleteHandler(List<Contact> oldContacts) {
        Set<Id> accountIds = new Set<Id>();
            for (Contact con : oldContacts){
               if(String.isNotBlank(con.Accountid)){
                accountIds.add(con.AccountId);
                String accountId = con.AccountId;
                }
            }
        AccountContactService.updateActiveContacts(accountIds);
    }

    public static void afterUndeleteHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
            for (Contact con : newContacts){
               if(String.isNotBlank(con.Accountid)){
                accountIds.add(con.AccountId);
                String accountId = con.AccountId;
                }
            }
        AccountContactService.updateActiveContacts(accountIds);
    }
}