@isTest
public with sharing class AccountTriggerHandlerTest {

    @TestSetup
    static void makeData(){

        BackListReason__c reason = new BackListReason__c(
            Name = 'BackListReasonA'
            , RootDocument__c = '26877934'
            , Restriction__c = 'Document invalid with restriction'
        );
        insert reason;
            
    }

    @isTest
    static void givenAccountWithDocumentRestrictionWhenCreatedThenReturnError() {

        Account pessoaJuridicaA = new Account(Name = 'Anderson Cesar', CPFCNPJ__c ='26.877.934/0001-08', RecordTypeId = new AccountConstants().RECORDTYPEID_PESSOA_JURIDICA);
        Test.startTest();

        try {
            
            insert pessoaJuridicaA;
        } catch (DmlException dmlex) {

            Assert.areEqual('Document invalid with restriction', dmlex.getDmlMessage(0), 'should message of erro');
        }
        
        Test.stopTest();
    }

    @isTest
    static void givenAccountWithAnualRevenueMoreOneMillionWhenCreatedThenReturnEvent() {

        Account accountPremium = new Account(Name = 'Anderson Cesar'
                                                , CPFCNPJ__c ='26.877.934/0001-08'
                                                , RecordTypeId = new AccountConstants().RECORDTYPEID_PESSOA_JURIDICA
                                                , Category__c = 'Premium'
                                                , AnnualRevenue = 1000000);
        Test.startTest();

        insert accountPremium;

        Test.stopTest();

        List<Event> events = [SELECT Id FROM Event LIMIT 1];

        Assert.isFalse(events.isEmpty(), 'Should have a event');
    }

    @isTest
    static void givenAccountCondominioWithAccountIncorporadoraWhenActiveThenUpdateAddress() {

        Account incorporadora = new Account(Name = 'Incorporadora'
                                                , CPFCNPJ__c ='26.877.934/0001-69'
                                                , Type = 'Incorporadora'
                                                , Category__c = 'Premium'
                                                , AnnualRevenue = 1000000
                                                , Status__c = 'Ativo'
                                                , ShippingStreet = 'Rua do comerciante N 22'
                                                , ShippingCity = 'Belém'
                                                , ShippingCountry = 'Brasil'
                                                , ShippingState = 'PA'
                                                );

        Account condominio = new Account(Name = 'Condominio'
                                                , CPFCNPJ__c ='26.877.934/0001-69'
                                                , Type = 'Condominio'
                                                , Category__c = 'Premium'
                                                , AnnualRevenue = 1000000
                                                , Status__c = 'Inativo');

        List<Account> accounts = new List<Account> {incorporadora, condominio};

        insert accounts;

        Test.startTest();

        condominio.OriginalAccount__c = incorporadora.Id;
        condominio.Status__c = 'Ativo';

        update condominio;

        Test.stopTest();

        Account incorporadoraUpdated = [SELECT Status__c FROM Account WHERE Name = 'Incorporadora' LIMIT 1];

        Account condominioUpdated = [SELECT Status__c, ShippingAddress, ShippingCity, ShippingCountry, ShippingState FROM Account WHERE Name = 'Condominio' LIMIT 1];

        Assert.areEqual('Inativo', incorporadoraUpdated.Status__c, 'Should Inactive');
        Assert.areEqual(incorporadora.ShippingAddress, condominioUpdated.ShippingAddress, 'Not equals address');
        Assert.areEqual(incorporadora.ShippingCity, condominioUpdated.ShippingCity, 'Not equals city');
        Assert.areEqual(incorporadora.ShippingCountry, condominioUpdated.ShippingCountry, 'Not equals country');
        Assert.areEqual(incorporadora.ShippingState, condominioUpdated.ShippingState, 'Not equals state');
    }

}