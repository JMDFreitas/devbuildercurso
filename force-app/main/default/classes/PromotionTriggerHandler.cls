public with sharing class PromotionTriggerHandler extends TriggerHandler {

    private List<Promotion__c> newPromotions;

    private Map<Id, Promotion__c> oldPromotions;

    private PromotionFilter filter;

    private PromotionProductEnricher productEnricher;

    private ProductPromotionEnricher promotionEnricher;
    
    public PromotionTriggerHandler() {
        this(
            (List<Promotion__c>) Trigger.new
            ,(Map<Id, Promotion__c>) Trigger.oldMap
        );
    }

    public PromotionTriggerHandler(List<Promotion__c> newPromotions
                                , Map<Id, Promotion__c> oldPromotions) {
                                    
        this.newPromotions = newPromotions;
        this.oldPromotions = oldPromotions;
        this.filter = new PromotionFilter();
        this.productEnricher = new PromotionProductEnricher();
        this.promotionEnricher = new ProductPromotionEnricher();
        
    }

    override
    public void afterUpdate() {
        productEnrich();
    }

    public void productEnrich() {

        List<Promotion__c> activedPromotions = this.filter.byChangedValue(newPromotions, oldPromotions, 'Status__c', 'Ativa');

        if (activedPromotions.isEmpty()) return;

        this.promotionEnricher.enrich(this.productEnricher.enrich(activedPromotions));
 
    }
}