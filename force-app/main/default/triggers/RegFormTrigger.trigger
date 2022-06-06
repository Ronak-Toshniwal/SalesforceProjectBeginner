trigger RegFormTrigger on Registration__c (before insert, before update) {
    if(trigger.isAfter ){
        if (trigger.isInsert){
            
   
	for(Registration__c rec = trigger.new){
                        integer famincome=0;
                        integer classpercent=0;
                        integer parents=0;
                        integer	working=0;
                        integer total=0;
                        
                       
                            
                          //family income
                        if(rec.Family_income__c == 'less3'){
                          famincome=50;
                             
                        } 
                        else if (rec.Family_income__c == '3to5' || rec.Family_income__c == '5to10' ) {
                            famincome = 40;
                            
                                } 
                        else {
                                 famincome = 50 ;
                            
                                }
                        
                        // ==========FAM INCOME END============
                        
                        
                        
                        // ==========CLASS PERCENTAGE ============
                            if(rec.Last_class_percentage__c < 59) {
                                classpercent = 5;
                            }
                        else if (rec.Last_class_percentage__c >= 60 && rec.Last_class_percentage__c < 69 ){
                            classpercent = 15;
                        }
                        else if (rec.Last_class_percentage__c >= 70 && rec.Last_class_percentage__c < 79 ){
                            classpercent = 20;
                        }
                        else if (rec.Last_class_percentage__c >= 80 && rec.Last_class_percentage__c < 89 ){
                            classpercent = 25;
                        }
                        else {
                            classpercent = 30;
                        }
                        
                      
                    
                    
                    // ==========CLASS PERCENTAGE END ============
                    
                        
                        // ==========ParentsAlive ============
                    
                         if(rec.Father_alive__c == 'yes' && rec.Mother_alive__c == 'Yes') {
                            parents = 5;
                        }  else if(rec.Father_alive__c == 'No' || rec.Father_alive__c == 'No') {
                            parents=10;
                        }
                        
                       
                        // ==========ParentsAlive  END============
                     
                        // ==========TOTAL POINTS CALCULATE  ============
                        if(rec.Father_alive__c == 'No' || rec.Father_alive__c == 'No'){
                            working = 10;
                        }
                         total = famincome + classpercent + parents + working;
                        rec.Total_Points__c = total;
                             System.debug('TOTAL: '+total );
                       
                    // ==========TOTAL POINTS CALCULATE  END============
                    
                    //===========Set Priority =============
                    if (total <= 60) {
                        rec.Priority__c = 5;
                    }
                    else if (total >= 61 && total <=75){
                        rec.Priority__c = 4;
                    }
                    else if (total >= 76 && total <=85){
                        rec.Priority__c = 3;
                    }
                    else if (total >= 86 && total <=90){
                        rec.Priority__c = 2;
                    }
                        
                    else {
                        rec.Priority__c = 1;
                    }
                    // update data;
                        system.debug(rec.Priority__c);
                    //===========Set Priority END=============
                    }
      }
          }
}
 /*   if(Trigger.isBefore){
        if(Trigger.isUpdate){
            List<Registration__c> allRecords = [select Id, Name, Priority__c from Registration__c];
           		for(integer i=0; i<allRecords.size(); i++){
                    
                    for(Registration__c t:Trigger.New){
                       if(allRecords[i].Priority__c > t.Priority__c){
                        	t.addError('bad');
                        
                    	}
                    }
            }
            
        }
}
}
    
    /*
      if(allRecords.Priority__c > > t.Priority__c){
                        system.debug('****THIS CODE IS WORKING****');
                        
                    }
	
     /*                    
List<Registration__c> priorityCheck = [select Priority__c, Status__c from Registration__c];
for(Registration__c prior : trigger.new){
    if(prior.Status__c == 'Approved' || prior.Status__c == 'Rejected'){
        if(prior.Priority__c <= prior.Priority__c){
           
        } else {
            prior.addError('First approve or Reject High Priority Registrations');
        }
    }
} */
