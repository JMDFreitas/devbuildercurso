public inherited sharing class AccountFilter extends Filter{

    public List<Account> byChangedDocument(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        return byChangedFields(
            byNotEmpty(newAccounts, 'CPFCNPJ__c')
            , oldAccounts
            , new List<String>{ 'CPFCNPJ__c' });
    }

    // public List<Account> byLegalEntity(list<Account> accounts) {
    //     list<Account> filteredAccounts = new List<Account>();

    //     for (Account account : accounts) {

    //         if (account.RecordTypeId == this.constants.RECORDTYPEID_PESSOA_JURIDICA) {
    //             filteredAccounts.add(account);
    //         }
    //     }
    //     return filteredAccounts;
    // }

    // public List<Account> byDocumentChanged(list<Account> accounts, Map<Id, Account> oldAccountsById) {
    //     list<Account> filteredAccounts = new List<Account>();

    //     for (Account account : accounts) {

    //         if (
    //             account.CPFCNPJ__c != oldAccountsById.get(account.Id).CPFCNPJ__c &&
    //             String.isNotEmpty(account.CPFCNPJ__c)
    //         ) {
    //             filteredAccounts.add(account);
    //         }
    //     }

    //     return filteredAccounts;
    // }
}