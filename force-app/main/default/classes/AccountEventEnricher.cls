public class AccountEventEnricher {

    EventRepository repository;

    public AccountEventEnricher() {
        this.repository = new EventRepository();
    }

    public List<Event> enrich(List<Account> premiumAccounts) {

        List<Event> events = new List<Event>();

        for (Account account : premiumAccounts) {

            events.add(buildEvent(account));
        }

        return repository.save(events);
    }

    private Event buildEvent(Account account) {

        Datetime today = Datetime.now().addDays(1);

        return new EventBuilder()
                    .withSubject('Apresentação instucional dos produtos Premium')
                    .withDescription('Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium')
                    .withContactType('Phone')
                    .withWhatId(account)
                    .withStartDateTime(today)
                    .withEndDateTime(today.addHours(1))
                    .build();
    }
}