trigger CaseforRegistration on Case (before update) {
       /*    List<Registration__c> Bef = Trigger.new();
  			List<Registration__c> ListofId = [select id, Name from Registration__c];	
    		system.debug("Ronak : ", ListofId);
    */
    
    /* List<Registration__c> c = [SELECT Id, Name FROM Registration__c ];
   				  for(integer i=0; i < c.size(); i++){
                if(caseList[i].PriorityNum__c != null){
                system.debug(caseList[i].PriorityNum__c);
              //  system.debug(caseList[i].id);
                } */
}