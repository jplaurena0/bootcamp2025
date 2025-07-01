public class LeadTriggerHandler {
    
    public static void beforeInsertHandler(List<Lead> newRecords) {
        for(Lead leadRecord : newRecords){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
    
                if(String.isBlank(leadRecord.Industry)){
                    leadRecord.addError('The industry field cannot be blank');
                }
            }
        }

    public static void afterInsertHandler(List<Lead> newRecords) {
        List<Task> leadTasks = new List<Task>();
            for(Lead leadRecord : newRecords){
                Task leadTask = new Task(Subject = 'Follow up on Lead Status', WhoId = leadRecord.Id);
                leadTask.Status = 'Not Started';
                leadTask.Priority = 'Normal';
                leadTasks.add(leadTask);
            }
            insert leadTasks;
            if(LeadTriggerHandler.alreadyExecuted == false){
                LeadTriggerHandler.alreadyExecuted = true;
                Lead anotherLead = new Lead (LastName = 'Test Lead Single', Status = 'Open - Not Contacted', Company = 'Individual');
                insert anotherLead;
        }
    }
    
    public static void beforeUpdateHandler(List<Lead> newRecords, Map<Id, Lead> oldRecordsMap) {
        for(Lead leadRecord : newRecords){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
                if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && oldRecordsMap.get(leadRecord.Id).Status == 'Open - Not Contacted'){
                leadRecord.Status.addError('You cannot close an open lead record');
                }
           }
    }
}