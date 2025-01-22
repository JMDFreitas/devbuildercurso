@isTest
public class PromotionTriggerHandlerTest {
    @isTest
    static void sholudCreateProductKitAndPromotionalProductRelated() {
        Promotion__c promotion = new Promotion__c( DueDate__c =  Date.today().addDays(5)
                                                , PromotionName__c = 'Kit'
                                                , StartDate__c = Date.today()
                                                , EndDate__c = Date.today().addDays(5)
                                                , Status__c = 'Rascunho');


        insert promotion;

        Test.startTest();

        promotion.Status__c = 'Ativa';
        update promotion;

        Test.stopTest();

        List<Product2> products = [SELECT Id FROM Product2 WHERE Promotion__c = : promotion.Id];
        List<Promotion__c> promotionalRelateds = [SELECT Id FROM Promotion__c  WHERE KitPromotionalProduct__c = : products[0].Id];

        Assert.isFalse(promotionalRelateds.isEmpty(), 'Should a not null record');
        Assert.isFalse(products.isEmpty(), 'Should a not null record');
    }
}