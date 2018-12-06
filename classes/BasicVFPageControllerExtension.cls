public class BasicVFPageControllerExtension {
	
    Public Positions__C inputPosition {get;set;}
    
    /*public BasicVFPageController(){
        inputPosition = new Positions__C();
    } */
    
   /* public List<Positions__c> getPositions(){
        List<Positions__c> positionList=[select name, functional_area__c 
                            	            from Positions__c
                                        limit 10];
        
        return positionList;
    }*/
   
     public void insertPositions(){
        insert inputPosition;
         //return null;
    }

}