public with sharing class AccountDocumentValidator extends DocumentValidator {

    private BackListReasonFilter reasonFilter;

    public AccountDocumentValidator() {
        this.reasonFilter = new BackListReasonFilter();
    }

    public void validateDocument(List<Account> accounts) {

        for (Account account : accounts) {
            if(super.isValid(account.CPFCNPJ__c) ) {
                continue;
            }
            account.addError('Document Invalid');
        }
    }

    public void validateRootDocument(List<Account> accounts, List<BackListReason__c> reasons) {

        if (reasons.isEmpty()) {
            return;
        }
            
        Map<String, BackListReason__c> reasonsByRootDocument = this.reasonFilter.grouppedByRootDocument(reasons);

        System.debug(reasonsByRootDocument);

        for (Account account : accounts) {
            String rootDocument = account.CPFCNPJ__c.substringBefore('/').remove('.');

            if(reasonsByRootDocument.containsKey(rootDocument)) {

                account.addError(reasonsByRootDocument.get(rootDocument).Restriction__c);
            }
        }
    }
}