public class CaseExtensionClass {
    
    private final Case cas;

    public CaseExtensionClass(ApexPages.StandardController stdController){
        this.cas = (Case)stdController.getRecord();
    }
}