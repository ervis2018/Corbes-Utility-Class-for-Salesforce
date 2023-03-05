/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/MyWebService/*')
global with sharing class RESTWebService {
    
    @HttpPost
    global static String createRecord(String name, String email) {
        Contact contact = new Contact();
        contact.FirstName = name;
        contact.Email = email;
        insert contact;
        return 'Contact created successfully';
    }

    @HttpGet
    global static Contact getRecord() {
        String id = RestContext.request.params.get('id');
        Contact contact = [SELECT Id, FirstName, Email FROM Contact WHERE Id = :id];
        return contact;
    }

    @HttpPut
    global static String updateRecord(String id, String name, String email) {
        Contact contact = [SELECT Id, FirstName, Email FROM Contact WHERE Id = :id];
        contact.FirstName = name;
        contact.Email = email;
        update contact;
        return 'Contact updated successfully';
    }

    @HttpDelete
    global static String deleteRecord() {
        String id = RestContext.request.params.get('id');
        Contact contact = [SELECT Id FROM Contact WHERE Id = :id];
        delete contact;
        return 'Contact deleted successfully';
    }
}
