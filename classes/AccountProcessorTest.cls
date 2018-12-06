@isTest
private class AccountProcessorTest {
    
    @isTest(SeeAllData=TRUE)
    private static void testAccountCount()
    {
        List<ID> accIDList=new List<ID>();
        test.startTest();
        List<Account> accList=[select ID from account limit 20];
        for(Account acc:accList)
        {
            accIDList.add(acc.ID);
        }
        AccountProcessor.countContacts(accIDList);
        test.stopTest();
    }
}