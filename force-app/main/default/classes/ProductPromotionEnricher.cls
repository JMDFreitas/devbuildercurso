public class ProductPromotionEnricher {

    private PromotionRepository repository;

    public ProductPromotionEnricher() {
        this.repository = new PromotionRepository();
    }

    public List<Promotion__c> enrich(List<product2> products) {

        List<Promotion__c>  promotionsToUpdate = new List<Promotion__c>();

        for (Product2 product : products) {

            promotionsToUpdate.add(buildPromotion(product));
        }

        return repository.save(promotionsToUpdate);
    }

    private Promotion__c buildPromotion(Product2 product) {
        return new PromotionBuilder().withId(product.Promotion__c)
                                    .withProductId(product.Id)
                                    .build();
    }
}