public class PromotionProductEnricher {

    private PromotionRepository repository;

    public PromotionProductEnricher() {
        this.repository = new PromotionRepository();
    }

    public List<Product2> enrich(List<Promotion__c> promotionsActived) {

        List<Product2> productstoInsert = new List<Product2>();

        for (Promotion__c promotion : promotionsActived) {

            Product2 product = new Product2(Name ='Product teste', ProductCode ='003003003', Promotion__c = promotion.Id);
            productstoInsert.add(product);

        }

        return repository.save(productstoInsert);

    }
}