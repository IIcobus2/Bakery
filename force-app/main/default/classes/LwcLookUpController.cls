public with sharing class LwcLookUpController {
    @AuraEnabled(cacheable=true)
    public static ResponseProduct findRecords(String searchKey) {
        string searchText = '\'%' + String.escapeSingleQuotes(searchKey) + '%\'';
        string query = 'SELECT id, Name FROM Products__c WHERE Name LIKE '+searchText+'';
        List<Products__c> returnQuery = Database.query(query);
        System.debug(returnQuery);
            

        
        
        List<Product> products = new List<Product>();

        for(Products__c pro : returnQuery){
            Product prod = new Product(pro.id, pro.name);

            products.add(prod);
        }
        
        ResponseProduct responsePro = new ResponseProduct(products);

        return responsePro;
    }

    
 
    public class ResponseProduct{
        @AuraEnabled
        public List<Product> product;

        public ResponseProduct(List<Product> product){
            this.product = product;
        }
    }

    public class Product{
        @AuraEnabled
        public String id;
        @AuraEnabled
        public String name;

        public Product(String id, String Name){
            this.id = id;
            this.name = name;
        } 
    }

    
}
