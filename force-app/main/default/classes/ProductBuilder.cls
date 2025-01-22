public class ProductBuilder {

    Product2 product;

    public ProductBuilder() {
        this.product = new Product2();
    }

    public ProductBuilder withName(String name) {
        this.product.Name = name;
        return this;
    }

    public ProductBuilder withProductCode(String productCode) {
        this.product.ProductCode = productCode;
        return this;
    }

    public ProductBuilder withPromotionId(String promotionId) {
        this.product.Promotion__c = promotionId;
        return this;
    }

    public Product2 build() {
        return product;
    }
}