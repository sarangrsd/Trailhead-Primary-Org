global class AccountProcessor {
    
    @future
    public static void countContacts(List<ID> accountIDs)
    {
        List<Account> accountList=[select Number_of_Contacts__c, (select id from contacts) from Account
                                   where id in : accountIDs];
        System.Savepoint sp = database.setSavepoint();
        For(Account acc:accountList)
        {
            acc.Number_of_Contacts__c=acc.contacts.size();
        }
        try{
            update accountList;
        }
        catch(Exception e){
            Database.rollback(sp);
        }
    }
}