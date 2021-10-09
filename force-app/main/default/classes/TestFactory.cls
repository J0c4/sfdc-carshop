public class TestFactory {
    public static User createGenericUser(String profile) {
        return new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = :profile].Id,
            UserRoleId = [SELECT Id FROM UserRole WHERE Name = :profile].Id,
            LastName = 'testlastname',
            Email = 'test.carshop@jala-foundation.org',
            UserName = 'test.carshop.' + DateTime.now().getTime() + '@jala-foundation.org',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US'
          );
    }

    public static Order__c createGenericOrder() {
        return new Order__c(
            Buyer_Address__c = 'Address',
            Buyer_Name__c = 'Name',
            Buyer_Phone__c = 'Phone',
            Status__c = 'Approved',
            Total_Price__c = 100
        );
    }

    public static Item__c createGenericItem() {
        return new Item__c(
            Car_Brand__c = 'Mazda',
            Name = 'Item',
            Price__c = 100,
            Type__c = 'Spare',
            Units__c = 1
        );
    }
}
