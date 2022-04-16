public class paypalRest {
    //Make sure your Salesforce instance URL is added in remote site settings
    String sfdcURL = URL.getSalesforceBaseUrl().toExternalForm(); 
    String restAPIURL = 'https://api.sandbox.paypal.com/v1/oauth2/token';  
    
    Public void requestMethod(){
        HttpRequest request = new HttpRequest(); 
        request.setMethod('POST'); 
        request.setHeader('Authorization', 'Basic Auth');
		//request.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 
		//request.setHeader('grant_type', 'client_credentials');
		request.setHeader('username', 'AUumhgz8ReWLipO5kEiUpOWTu25BvT_tl4tP_QY0W841GcPRZKeCEFn2JzxNUWmhN7o2APCO_0eBVvTX'); 
		request.setHeader('password', 'lNHRtl03W5eVbxnwJdkNiiLU1BAY_HGKVdDlxVDbn2vasoq_MVoVSYJx0Z5hOMncvnkawZ1Xkpe');         
        request.setEndpoint(restAPIURL); 
        request.setBody('x-www-form-urlencoded');
        String response = '';
        try {  
            Http http = new Http();   
            HttpResponse httpResponse = http.send(request);  
           	System.debug('httpResponse.getStatusCode() '+httpResponse.getStatusCode()); 
            if (httpResponse.getStatusCode() == 200) {  
                response = JSON.serializePretty( JSON.deserializeUntyped(httpResponse.getBody()) );  
            } else {  
                System.debug(' httpResponse ' + httpResponse.getBody() );  
                throw new CalloutException( httpResponse.getBody() );  
            }   
        } catch( System.Exception e) {  
            System.debug('ERROR: '+ e);  
            throw e;  
        }  
        System.debug(' ** response ** : ' + response); 
    }
}