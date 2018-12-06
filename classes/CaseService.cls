global with sharing class CaseService {
    
    global static void closeCases(Set<Id> caseIds, String closeReason){
        List<Case> caseListToBeUpdated = new List<Case>();
        for(Case aCase : [select Reason, Status from Case
                          where id in: caseIds]){
                              aCase.Status = 'Closed';   
                              aCase.Reason = closeReason;
                              caseListToBeUpdated.add(aCase);
                          }
        update caseListToBeUpdated;
    }
}