trigger RegFormTrigger on Registration__c (after insert, before update) {
    if(trigger.isAfter ){
        if (trigger.isInsert){
            
     List<Registration__c> data = [select Name, Previous_class__c, Required_Admission_In_Class__c, Occupation_of_father__c,Last_class_percentage__c, Occupation_of_mother__c,Family_income__c,Father_alive__c, Mother_alive__c,  Name__c, Status__c, Address__c, Priority__c,Total_Points__c from Registration__c];
                    for(integer i=0;i<data.size();i++){
                        integer famincome=0;
                        integer classpercent=0;
                        integer parents=0;
                        integer	working=0;
                        integer total=0;
                        
                       
                            
                          //family income
                        if(data[i].Family_income__c == 'less3'){
                          famincome=50;
                             
                        } 
                        else if (data[i].Family_income__c == '3to5' || data[i].Family_income__c == '5to10' ) {
                            famincome = 40;
                            
                                } 
                        else {
                                 famincome = 50 ;
                            
                                }
                        
                        // ==========FAM INCOME END============
                        
                        
                        
                        // ==========CLASS PERCENTAGE ============
                            if(data[i].Last_class_percentage__c < 59) {
                                classpercent = 5;
                            }
                        else if (data[i].Last_class_percentage__c >= 60 && data[i].Last_class_percentage__c < 69 ){
                            classpercent = 15;
                        }
                        else if (data[i].Last_class_percentage__c >= 70 && data[i].Last_class_percentage__c < 79 ){
                            classpercent = 20;
                        }
                        else if (data[i].Last_class_percentage__c >= 80 && data[i].Last_class_percentage__c < 89 ){
                            classpercent = 25;
                        }
                        else {
                            classpercent = 30;
                        }
                        
                      
                    
                    
                    // ==========CLASS PERCENTAGE END ============
                    
                        
                        // ==========ParentsAlive ============
                    
                         if(data[i].Father_alive__c == 'yes' && data[i].Mother_alive__c == 'Yes') {
                            parents = 5;
                        }  else if(data[i].Father_alive__c == 'No' || data[i].Father_alive__c == 'No') {
                            parents=10;
                        }
                        
                       
                        // ==========ParentsAlive  END============
                     
                        // ==========TOTAL POINTS CALCULATE  ============
                        if(data[i].Father_alive__c == 'No' || data[i].Father_alive__c == 'No'){
                            working = 10;
                        }
                         total = famincome + classpercent + parents + working;
                        data[i].Total_Points__c = total;
                             System.debug('TOTAL: '+total );
                       
                    // ==========TOTAL POINTS CALCULATE  END============
                    
                    //===========Set Priority =============
                    if (total <= 60) {
                        data[i].Priority__c = 5;
                    }
                    else if (total >= 61 && total <=75){
                        data[i].Priority__c = 4;
                    }
                    else if (total >= 76 && total <=85){
                        data[i].Priority__c = 3;
                    }
                    else if (total >= 86 && total <=90){
                        data[i].Priority__c = 2;
                    }
                        
                    else {
                        data[i].Priority__c = 1;
                    }
                     update data;
                        system.debug(data[i].Priority__c);
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