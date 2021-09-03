global with sharing class BuyItem implements Schedulable{
    global void execute(SchedulableContext SC){
        this.buyItem();
    }
    
    public void buyItem() {
        List<MakePurchase__c> purchaseList = [SELECT Client__r, Product__r FROM MakePurchase__c];
    }
}
