global class Promotion implements Schedulable {
   global void execute(SchedulableContext SC) {
        this.datePromo();
    }    
    
    public void datePromo(){
        List<Employee__c> employee = [SELECT id, EmployeeTitle__c, HiringDate__c FROM Employee__c];
        
        
        for(Employee__c ep : employee){
            if(employee.size() == 0) break;
            
            if(Date.today()-365 >= ep.HiringDate__c){
                if(ep.EmployeeTitle__c == 'Janitor'){
                    ep.EmployeeTitle__c = 'Replenisher';
                    
                }else if(ep.EmployeeTitle__c == 'Baker Assistant'){
                    ep.EmployeeTitle__c = 'Baker';  
                    
                }else if(ep.EmployeeTitle__c == 'Replenisher'){
                    ep.EmployeeTitle__c = 'Cashier';
                    
                }else if(ep.EmployeeTitle__c == 'Cashier'){
                	ep.EmployeeTitle__c = 'Manager'; 
                }
                
            
            }
            
        }
        // Salary hierarquy = Janitor -> Replenisher -> Security guard-> Cashier -> Baker Assistant -> Baker -> Manager
        update employee;
    }
}