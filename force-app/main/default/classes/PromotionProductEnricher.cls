public class PromotionProductEnricher {

    private PromotionRepository repository;

    public PromotionProductEnricher() {
        this.repository = new PromotionRepository();
    }

    public List<Product2> enrich(List<Promotion__c> promotionsActived) {

        List<Product2> productstoInsert = new List<Product2>();

        for (Promotion__c promotion : promotionsActived) {

            productstoInsert.add(buildProduct(promotion));
        }

        return repository.save(productstoInsert);

    }

    private product2 buildProduct(Promotion__c promotion) {

        return new ProductBuilder().withName('Product Kit promotion')
                                    .withProductCode('003003003')
                                    .withPromotionId(promotion.Id)
                                    .build(); 
    }
}