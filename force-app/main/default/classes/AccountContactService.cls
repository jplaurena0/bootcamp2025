public  class AccountContactService {
    public static void updateActiveContacts(Set<Id> accountIds) {
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) FROM Contact WHERE Active__c = true AND AccountId IN: accountIds GROUP BY AccountId];
                    
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        for (AggregateResult result : results){
                    String accId = String.valueOf(result.get('AccountId'));
                    Integer totalActiveContacts = (Integer)result.get('totalActiveContacts');
                    
                    Account acc = new Account(Id = accId, Active_Contact__c = totalActiveContacts);
                    accountsToUpdate.put(accId, acc);
            }

            for(Id accid : accountIds){
                if(!accountsToUpdate.containsKey(accId)){
                    accountsToUpdate.put(accId, new Account(Id = accId, Active_Contact__c = 0));
                }
            }
            update accountsToUpdate.values();
    }
}