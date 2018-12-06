@isTest
public class AddPrimaryContactTest 
{
    
	@testSetup static void setup()
    {
        List<Account> accList=new List<Account>();
        for(Integer i=0;i<50;i++)
        {
            accList.add(new Account(name='AccCA '+i, BillingState = 'CA'));
            accList.add(new Account(name='AccNY '+i, BillingState = 'NY'));
        }
        insert accList;
    }
    
    @isTest
    static void testQueueable()
    {
        test.startTest();
        System.enqueueJob(new AddPrimaryContact(new Contact(lastname='testcon'), 'CA'));
        test.stoptest();
        system.assertEquals(50,[select count() from contact where account.BillingState='CA']);
    }
}