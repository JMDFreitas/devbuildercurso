public class AccountEventEnricher {

    EventRepository repository;

    public AccountEventEnricher() {
        this.repository = new EventRepository();
    }

    public List<Event> enrich(List<Account> premiumAccounts) {

        List<Event> events = new List<Event>();

        Datetime today = Datetime.now().addDays(1);

        System.debug(LoggingLevel.DEBUG, 'Premium Accounts: ' + premiumAccounts);

        for (Account account : premiumAccounts) {

            events.add( new Event(
                Description = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium'
                , Subject = 'Apresentação instucional dos produtos Premium'
                , StartDateTime = today
                , EndDateTime = today.addHours(1)
                , WhatId = account.Id
                , ContactType__c = 'Phone'
            ));
        }

        return repository.save(events);
    }
}