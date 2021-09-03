public class UpdateSalary {
  @InvocableMethod (label='Update Salary') 

  public Static void updateSalaryOnModify(List<id> ids){
    List<Employee__c> employeeList = [SELECT id, EmployeeTitle__c, Salary__c FROM Employee__c WHERE id in :ids];

    for(Employee__c ep : employeeList){
      if(employeeList.size() == 0) break;
      switch on ep.EmployeeTitle__c {
        when 'Janitor'{ep.Salary__c = 1000;}
        when 'Replenisher' {ep.Salary__c = 2000;}
        when 'Security guard'{ep.Salary__c = 3000;}
        when 'Cashier'{ep.Salary__c = 3500;}
        when 'Baker Assistant'{ep.Salary__c = 3500;}
        when 'Baker'{ep.Salary__c = 4000;}
        when 'Manager'{ep.Salary__c = 5000;}
        when else {ep.Salary__c = 0;} 
      }
    }
    update employeeList;




    // for(Employee__c ep : employeeList){
    //   if(employeeList.size() == 0) break;

    //   if(ep.EmployeeTitle__c == 'Janitor'){
    //     ep.Salary__c = 1000;
    //   }else if(ep.EmployeeTitle__c == 'Replenisher'){
    //     ep.Salary__c = 2000;
    //   }else if(ep.EmployeeTitle__c == 'Security guard'){
    //     ep.Salary__c = 3000;
    //   }else if(ep.EmployeeTitle__c == 'Cashier'){
    //     ep.Salary__c = 3500;
    //   }else if(ep.EmployeeTitle__c == 'Baker Assistant'){
    //     ep.Salary__c = 3500;
    //   }else if(ep.EmployeeTitle__c == 'Baker'){
    //     ep.Salary__c = 4000;
    //   }else if(ep.EmployeeTitle__c == 'Manager'){
    //     ep.Salary__c = 5000;
    //   }else{
    //     ep.Salary__c = 0;
    //   }
    // }
    // update employeeList;
  }
}