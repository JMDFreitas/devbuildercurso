public class BackListReasonRepository {
    public List<BackListReason__c> findByRootDocument(List<String> rootDocuments) {
        return [
            SELECT 
            Id
            , Name
            , Restriction__c
            , RootDocument__c 
            FROM BackListReason__c
            WHERE RootDocument__c IN :rootDocuments
        ];
    }
}