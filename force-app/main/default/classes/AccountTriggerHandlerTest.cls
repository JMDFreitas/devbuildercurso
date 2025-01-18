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

}