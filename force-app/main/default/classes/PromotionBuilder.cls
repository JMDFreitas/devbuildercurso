public class PromotionBuilder {
    Promotion__c promotion;

    public PromotionBuilder() {
        this.promotion = new Promotion__c();
    }

    public PromotionBuilder withId(String id) {
        this.promotion.Id = id;
        return this;
    }

    public PromotionBuilder withProductId(String productId) {
        this.promotion.KitPromotionalProduct__c = productId;
        return this;
    }

    public Promotion__c build() {
        return promotion;
    }
}