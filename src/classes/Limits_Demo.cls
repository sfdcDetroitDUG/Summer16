public class Limits_Demo {
    @future
    public static void myMethod() {
        System.debug('Remaining Asyncs: ' + System.limits.getLimitAsyncCalls());
        System.debug('Total Asyncs: ' + System.Limits.getAsyncCalls());
    }
}