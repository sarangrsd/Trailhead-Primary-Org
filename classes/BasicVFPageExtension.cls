public class BasicVFPageExtension {

    	private final Positions__c position;
    	public Blob myInputFile;
    	public List<Job_Application__c> jobAppli;
    
    public BasicVFPageExtension(ApexPages.StandardController stdController){
        this.position=(Positions__C)stdController.getRecord();
    }
    
        public PageReference upload(){
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'You cant save it yet');
		ApexPages.addMessage(myMsg); 
        return null;
    }	
    
    public List<Job_Application__c> getPostionReviews(){
       jobAppli =  [select 
           (Select name from Reviews__r) from
           Job_Application__c
           where Job_Application__c.Position__c = 'a019000000Gc4HyAAJ'];
        return jobAppli;
    }
}