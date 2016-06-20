public class Map_Populated_Fields_Controller {

    public Map<String, Object> mappedFields { get; set; }
    public List<accountResponse> ars        { get; set; }

    public Map_Populated_Fields_Controller() {
        List<Account> accs = [SELECT Id, Name, Industry, AnnualRevenue FROM Account LIMIT 10];
        ars = new List<AccountResponse>();
        populateArsMethod1(accs);
    }
        

    public void populateArsMethod1(List<Account> accs){
        for(Account acc : accs) {
            mappedFields = acc.getPopulatedFieldsAsMap();
            for (String fieldName : mappedFields.keySet()){
                System.debug('field name is ' + fieldName + ', value is ' + mappedFields.get(fieldName));
            }
            AccountResponse ar = new AccountResponse();
            ar.accountName = String.valueOf(mappedFields.get('Name'));
            ar.industry = String.valueOf(mappedFields.get('Industry'));
            ar.revenue = Double.valueOf(mappedFields.get('AnnualRevenue'));
            ar.createdDate = Date.valueof(mappedFields.get('createdDate'));
            ars.add(ar);
        } 
        
    }

    public void populateArsMethod2(List<Account> accs){
        for(Account acc : accs) {
            AccountResponse ar = new AccountResponse();
            ar.accountName = acc.Name;
            ar.industry = acc.industry;
            ar.revenue = acc.AnnualRevenue;
            ar.createdDate = acc.createdDate;
            ars.add(ar);
        }
        
    }

    public class AccountResponse {
        public string accountName   { get; set;}
        public string industry      { get; set;}
        public Double revenue       { get; set;}
        public DateTime createdDate     { get; set;}
    } 

}