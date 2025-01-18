public with sharing class AccountTriggerHandler extends TriggerHandler {

    private List<Account> newAccounts;

    private Map<Id, Account> oldAccounts;

    private AccountFilter filter;

    private AccountEventEnricher enricher;

    private AccountDocumentValidator validator; // validator class name tambem

    private BackListReasonRepository reasonRepository; // segundo exercicio

    private List<BackListReason__c> reasons;

    public AccountTriggerHandler() {
        this((List<Account>) Trigger.new
            ,(Map<Id, Account>) Trigger.oldMap);
    }

    public AccountTriggerHandler(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        // Trigger records contex
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        // Dependencies class
        this.filter = new AccountFilter();
        this.validator = new AccountDocumentValidator();
        this.reasonRepository = new BackListReasonRepository();
        this.enricher = new AccountEventEnricher();

        // Configure dependents
        this.reasons = this.reasonRepository.findByRootDocument(Lists.pullRootDocument(this.newAccounts));
        System.debug(LoggingLevel.DEBUG, 'this.reasons: ' + this.reasons);
    
    }

    override
    public void beforeInsert() {
        validate();
    }

    override
    public void afterInsert() {
        enrichEvent();
    }

    override
    public void beforeUpdate() {
        validate();   
    }
    
    private void validate() {
        this.validator.validateDocument(this.filter.byChangedDocument(newAccounts, oldAccounts));
    }

    private void enrichEvent() {
        this.enricher.enrich(this.filter.byValue(newAccounts, 'Category__c', 'Premium'));
    }
}