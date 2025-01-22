public class ProductPromotionEnricher {

    private PromotionRepository repository;

    public ProductPromotionEnricher() {
        this.repository = new PromotionRepository();
    }

    public List<Promotion__c> enrich(List<product2> products) {

        List<Promotion__c>  promotionsToUpdate = new List<Promotion__c>();

        for (Product2 product : products) {

            promotionsToUpdate.add(new Promotion__c(
                Id = product.Promotion__c
                , KitPromotionalProduct__c = product.Id
            ));
        }
        System.debug(LoggingLevel.DEBUG, 'promotionsToUpdate: ' + promotionsToUpdate);
        return repository.save(promotionsToUpdate);

    }
}