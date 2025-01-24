public class AccountEnricher {

    private AccountRepository accountRepository;

    public AccountEnricher() {

        this.accountRepository = new AccountRepsoitory();
    }

    public void enrich(List<Account> accounts) {

        List<String> OriginalAccountsId = List.pullField(accounts, 'OriginalAccount__c');

        Map<Id,Account> originalAccounts = new Map<Id,Account>(accountRepository.findById(OriginalAccountsId));

        for (Account account : accounts) {

            account.Status__c = 'Ativo';
            account.ShippingStreet = originalAccounts.get(account.OriginalAccount__c).ShippingStreet;
            
        }
    }
}