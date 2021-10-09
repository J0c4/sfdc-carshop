@isTest
class RecordLevelSecurityTest {
    @isTest
    static void getBuyerOrdersFromAnotherBuyerTest() {
        User buyer1 = TestFactory.createGenericUser('Buyer');
        User buyer2 = TestFactory.createGenericUser('Buyer');

        System.runAs(buyer1) {
            Order__c order1 = TestFactory.createGenericOrder();
            insert order1;
        }

        System.runAs(buyer2) {
            List<Order__c> orders = new List<Order__C>();
            orders = [SELECT Name FROM Order__c];

            System.assert(orders.size() == 0);
        }
    }

    @isTest
    static void getBuyerOrdersFromSalesRepTest() {
        User buyer = TestFactory.createGenericUser('Buyer');
        User salesrep = TestFactory.createGenericUser('Sales Rep');

        System.runAs(buyer) {
            Order__c order = TestFactory.createGenericOrder();
            insert order;
        }

        System.runAs(salesrep) {
            List<Order__c> orders = new List<Order__c>();
            orders = [SELECT Name FROM Order__c];

            System.assert(orders.size() == 1);
        }
    }
}
