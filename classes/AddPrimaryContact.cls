public class AddPrimaryContact implements Queueable
{

	String state;    
    Contact contact=new Contact();
	public AddPrimaryContact(Contact contact, String State)
    {
        this.state=State;
        this.contact=contact;
    }
    
    public void execute(QueueableContext conQ)
    {
        system.debug('contact: '+ contact);
        List<Contact> conList=new List<Contact>();
        List<Account> accList=[select id
                        from account
                        where BillingState =: state];
        for(Account acc:accList)
        {
            Contact clonedCon=contact.clone(false, true, false, false);
            clonedCon.AccountId=acc.id;
            conList.add(clonedCon);
        }
        insert conList;
    }
}