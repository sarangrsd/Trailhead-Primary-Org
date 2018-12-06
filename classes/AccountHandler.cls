public class AccountHandler {

    public static Account insertNewAccount(String AccountName)
    {
        Account returnValue=new Account();
        if(!String.isEmpty(AccountName))
        {
        	Account newAccount=new Account(Name=AccountName);
        	insert newAccount;
        	Account AccountReturned=[select ID, name from Account where ID=:newAccount.ID];
            	returnValue= AccountReturned;
        }
        if(String.isEmpty(AccountName))
        {
            try
            {
        	    Account emptyAccount=new Account();
       	     	insert emptyAccount;
        	}
        	catch(DmLException e){
        	    system.debug('The insertion deletefailed with message as: '+e.getMessage());
        	}
        }
                Return returnValue;
    }	

}