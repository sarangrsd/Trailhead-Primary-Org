public with sharing class CampingListController
{
    @AuraEnabled
    public static List<Camping_Item__c> getItems()
    {
        return [select Name, Quantity__c, Price__c, Packed__c
                from Camping_Item__c
               ];    
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item)
    {
        system.debug('Inside saveItem');
        upsert item;
        return item;
    }
    
    
}