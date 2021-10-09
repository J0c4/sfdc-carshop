public class TestFactory {
    public static User createGenericUser(String profile) {
        return new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = :profile].Id,
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
}
