public class Visualforce_Error_Controller {

    // Create variables to use on the page
    public List<Account> badList    { get; set; }
    public Account nullAccount      { get; set; }

    public Visualforce_Error_Controller() {
        // This query, in this org, doesnt return any values.
        this.badList = [SELECT Id, CreatedById FROM Account WHERE BillingLatitude = 1];
        // Since the query doesn't return any values, this will throw and exception
        this.nullAccount = badlist[0];
    }
}