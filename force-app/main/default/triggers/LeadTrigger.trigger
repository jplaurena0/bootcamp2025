trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {
    System.debug('Triggersize: ' + Trigger.size);
    System.debug('isExecuting: ' + Trigger.isExecuting);
    System.debug('Operation type: ' + Trigger.operationType);
    

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            LeadTriggerHandler.beforeInsertHandler(Trigger.new);

            /*for(Lead leadRecord : Trigger.new){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
    
                if(String.isBlank(leadRecord.Industry)){
                    leadRecord.addError('The industry field cannot be blank');
                }
            }*/
        }

        when AFTER_INSERT {
             LeadTriggerHandler.afterInsertHandler(Trigger.new);   

           /* List<Task> leadTasks = new List<Task>();
            for(Lead leadRecord : Trigger.new){
                Task leadTask = new Task(Subject = 'Follow up on Lead Status', WhoId = leadRecord.Id);
                leadTask.Status = 'Not Started';
                leadTask.Priority = 'Normal';
                leadTasks.add(leadTask);
            }
            insert leadTasks;

            Lead anotherLead = new Lead (LastName = 'Test Lead Single', Status = 'Open - Not Contacted', Company = 'Individual');
            insert anotherLead;*/
        }

        when BEFORE_UPDATE {
            LeadTriggerHandler.beforeUpdateHandler(Trigger.new, Trigger.oldMap);

           /* for(Lead leadRecord : Trigger.new){
                if(String.isBlank(leadRecord.LeadSource)){
                    leadRecord.LeadSource = 'Other';
                }
                if((leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed - Not Converted') && Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted'){
                leadRecord.Status.addError('You cannot close an open lead record');
                }
           }*/
       }
    }   
}