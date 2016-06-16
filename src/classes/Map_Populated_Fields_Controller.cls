public class Map_Populated_Fields_Controller {

    public Map<String, Object> mappedFields { get; set; }

    public Map_Populated_Fields_Controller() {
        Account a = [SELECT Id, Name, Industry, AnnualRevenue FROM Account LIMIT 1];
        
        mappedFields = a.getPopulatedFieldsAsMap();
        for (String fieldName : mappedFields.keySet()){
            System.debug('field name is ' + fieldName + ', value is ' + mappedFields.get(fieldName));
        }
    }

}