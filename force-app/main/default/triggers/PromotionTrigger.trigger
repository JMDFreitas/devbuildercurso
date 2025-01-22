trigger PromotionTrigger on Promotion__c (after update) {
    new PromotionTriggerHandler().run();
}