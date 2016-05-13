global class lightningTableWrapper {
    @AuraEnabled
    public Integer page { get;set; }

    @AuraEnabled
    public Integer total { get;set; }

    @AuraEnabled
    public List<sObject> sObjectrecords { get;set; }
}