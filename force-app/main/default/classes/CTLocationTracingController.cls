public class CTLocationTracingController {

    public static List<Location_Tracing__c> getVisitors(String locationId){
        return [SELECT Id, Name, Person__c, Location__c, Visit_Date__c,
        Person__r.Health_Status__c, Person__r.Token__c
        FROM Location_Tracing__c
        WHERE Location__c = :locationId
        ORDER BY Visit_Date__c DESC NULLS LAST];
    }

    public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){
        return [SELECT Id, Person__c, Location__c
        FROM Location_Tracing__c
        WHERE Person__c IN :personIds
        AND Visit_Date__c = LAST_N_DAYS:10];
    }

    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
        List<Location_Tracing__c> location = [SELECT Id, Person__c, Location__c
        FROM Location_Tracing__c WHERE id= :locationids
        AND Person__r.Health_Status__c = 'Green'
        AND Visit_Date__c = LAST_N_DAYS:10];
        if(location != null && location.size()>0){
            return location[0];
        }
        return null;
    }

    public static List<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> newlocationTraces){
        List<Location_Tracing__c> locationTracesDupes = [SELECT Id, Person__c, Location__c     
        FROM Location_Tracing__c
        WHERE Location__c IN :newlocationTraces];
        Set<Id> locationTraceIds = new Set<Id>();
    return null;
    }
}