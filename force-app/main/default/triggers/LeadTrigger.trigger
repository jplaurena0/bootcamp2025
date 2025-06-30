trigger LeadTrigger on Lead (before insert, before update) {
    System.debug('Lead trigger called');
    
    for(Lead leadRecord : Trigger.new){
        if(String.isBlank(leadRecord.LeadSource)){
            leadRecord.LeadSource = 'Other';
        }
    
        if(String.isBlank(leadRecord.Industry) && Trigger.isInsert){
            leadRecord.addError('The industry field cannot be blank');
        }
    
    }
    System.debug('Lead Trigger 1 is executing');
}