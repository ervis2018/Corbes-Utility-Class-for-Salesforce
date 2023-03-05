/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SchemaClassGetRecordtypeIdByName {
    public SchemaClassGetRecordtypeIdByName() {

        // Get the Contact object describe information
        Schema.DescribeSObjectResult contactDescribe = Contact.SObjectType.getDescribe();

        // Get the map of record type information for the Contact object
        Map<String, Schema.RecordTypeInfo> contactRecordTypes = contactDescribe.getRecordTypeInfosByName();

        // Get the record type ID for a specific record type name
        Id myRecordTypeId = contactRecordTypes.get('My Record Type Name').getRecordTypeId();
        System.debug('myRecordTypeId'+ myRecordTypeId);
    }
}