public with sharing class BackListReasonFilter {
    public Map<String, BackListReason__c> grouppedByRootDocument(List<BackListReason__c> reasons) {

        Map<String, BackListReason__c> reasonsByRootDocument = new Map<String, BackListReason__c>();

        for (BackListReason__c reason : reasons) {
            if (!reasonsByRootDocument.containsKey(reason.RootDocument__c)) {
                reasonsByRootDocument.put(reason.RootDocument__c, reason);
            }
        }
        return reasonsByRootDocument;
    }
}