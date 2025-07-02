public  class AccountContactService {
    public static void updateActiveContacts(Set<Id> accountIds) {
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) FROM Contact WHERE Active__c = true AND AccountId IN: accountIds GROUP BY AccountId];
                    
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results){
                    String accId = String.valueOf(result.get('AccountId'));
                    Integer totalActiveContacts = (Integer)result.get('totalActiveContacts');
                    
                    Account acc = new Account(Id = accId, Active_Contact__c = totalActiveContacts);
                    accountsToUpdate.add(acc);
            }
            update accountsToUpdate;
    }
}