public with sharing class UpdateQuantity {
    @InvocableMethod (label='Update Quantity Employees') 

    public Static void UpdateQuantity(List<id> ids) {

        List<Employee__c> employeeCountList = [SELECT Name, Store__c FROM Employee__c WHERE id in :ids];
        List<Stores__c> storesList = [SELECT id, Name, QuantityEmployees__c FROM Stores__c];        

        for(Employee__c ep : employeeCountList){
            if(employeeCountList.size() == 0)break;

            for(Stores__c st : storesList){
                if(storesList.size() == 0)break;
                if(st.QuantityEmployees__c == NULL) st.QuantityEmployees__c = 0; 

                if(ep.Store__c == st.id && st.QuantityEmployees__c != NULL){
                    st.QuantityEmployees__c +=1; 
                }
            }
        }  
        update storesList;
    }
}