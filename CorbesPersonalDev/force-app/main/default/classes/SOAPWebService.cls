/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 03-05-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
global class SOAPWebService {
    
    webservice static String getData(String param1, String param2) {
        // Your logic to retrieve data based on the input parameters
        return 'Data retrieved successfully!';
    }
    
}


//Observation Class must be global and also the methods
//Exposed methods must be annotated with the word @WebService.