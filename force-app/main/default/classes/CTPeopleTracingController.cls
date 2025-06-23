public class CTPeopleTracingController {

    public static List<People_Tracing__c> getTraces(String personId){
      return [SELECT Id, Name, Person_1__c, Person_2__c , Contact_Date__c, Contact_Type__c
        FROM People_Tracing__c
        WHERE Person_1__c = :personId
        OR Person_2__c = :personId
        ORDER BY Contact_Date__c DESC NULLS LAST];
    }

    public static List<People_Tracing__c> checkDuplicates(List<People_Tracing__c> newPeopleTraces){
      //  Set<Id> locationids = new Set<Id>();
        Set<Id> personids = new Set<Id>();

        for(People_Tracing__c trace: newPeopleTraces){
            personids.add(trace.Person_1__c);
            personids.add(trace.Person_2__c);        
        }
        List<People_Tracing__c> duplicates = new List<People_Tracing__c>();

        Map<Id, Set<Id>> mapOfExistingRecords = new Map<Id, Set<Id>>();

        List<People_Tracing__c> existingRecords = [SELECT Id, Name, Person_1__c, Person_2__c , Contact_Date__c, Contact_Type__c
                                                    FROM People_Tracing__c 
                                                    WHERE Person_1__c = :personIds
                                                    OR Person_2__c = :personIds];
 
        if (existingRecords != null && existingRecords.size() > 0 ){
            for(People_Tracing__c trace: existingRecords){
                if(!mapOfExistingRecords.containsKey(trace.Person_1__c)){
                    mapOfExistingRecords.put(trace.Person_1__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Person_1__c).add(trace.Person_2__c);
                
                if(!mapOfExistingRecords.containsKey(trace.Person_2__c)){
                    mapOfExistingRecords.put(trace.Person_2__c, new Set<Id>());
                }
                mapOfExistingRecords.get(trace.Person_2__c).add(trace.Person_1__c);  

            }
            for (People_Tracing__c trace : newPeopleTraces) {
                if(
                  (mapOfExistingRecords.containsKey(trace.Person_1__c) && mapOfExistingRecords.get(trace.Person_1__c).contains(trace.Person_2__c))
                    ||
                  (mapOfExistingRecords.containsKey(trace.Person_2__c) && mapOfExistingRecords.get(trace.Person_2__c).contains(trace.Person_1__c))
                ){
                    duplicates.add(trace);
                }
            }
        }
        return duplicates;
    }       
}
