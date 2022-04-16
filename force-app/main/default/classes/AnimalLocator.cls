public class AnimalLocator {
    
    public static string getAnimalNameById(Integer i){
        integer id=i;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String strResp = '';
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<string, Object> results = (Map<string, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string,object> animals = (map<string,object>) results.get('animal');
            // Cast the values in the 'animals' key as a list
            strResp = string.valueof(animals.get('name'));
            
        }
        return strResp;
    }
}