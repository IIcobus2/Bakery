public with sharing class LwcLookUpController {
    @AuraEnabled(cacheable=true)
    public static ResponseProduct findRecords(String searchKey) {
        string searchText = '\'' + String.escapeSingleQuotes(searchKey) + '%\'';
        string query = 'SELECT id, Name FROM Products__c WHERE Name LIKE '+searchText+' LIMIT 1';
        Products__c returnQuery = Database.query(query);
        System.debug(returnQuery);
        ResponseProduct responsePro = new ResponseProduct(returnQuery);

        System.debug(responsePro);
        return responsePro;
    }

    
 
    public class Product{
        @AuraEnabled
        public String id;
        @AuraEnabled
        public String name;

        public Product(String id, String name){
            this.id = id;
            this.name = name;
        }
    }

    public class ResponseProduct{
        @AuraEnabled
        public Product product;
        
        public ResponseProduct(Product product){
            this.product = product;
        }
    }
}
