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

    //https://yourinstance.salesforce.com/services/apexrest/MyWebService?id=003XXXXXXXXXXXXXXX
    @HttpGet
    global static Contact getRecord() {
        String id = RestContext.request.params.get('id');
        Contact contact = [SELECT Id, FirstName, Email FROM Contact WHERE Id = :id];
        return contact;
    }

    /*
    PUT /services/apexrest/MyWebService HTTP/1.1
    Host: yourinstance.salesforce.com
    Content-Type: application/json
    Authorization: Bearer <access_token>

    {
    "id": "003XXXXXXXXXXXXXXX",
    "name": "John",
    "email": "john.doe@example.com"
    }*/
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

    /*
    String endpoint = 'https://yourinstance.salesforce.com/services/apexrest/MyWebService';
    HttpRequest request = new HttpRequest();
    request.setEndpoint(endpoint);
    request.setMethod('GET');

    // Set up the SSL/TLS certificate for the request
    Blob certBlob = Blob.valueOf('-----BEGIN CERTIFICATE-----\n' +
                                'MIIDeTCCAmGgAwIBAgIJAxxxxxxxxxxxxxxxxxxxxxxxx\n' +
                                'vUfgrN+58wjM09Xz/xxxxxxxxxxxxxxxxxxxxxxxxxx\n' +
                                '-----END CERTIFICATE-----');
    Http http = new Http();
    http.setClientCertificate('your_certificate_label', certBlob);
    HttpResponse response = http.send(request);*/

}
