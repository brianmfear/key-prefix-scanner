@isTest class KeyPrefixScannerTest {
    @isTest static void referencePage() {
        Test.setCurrentPageReference(Page.keyPrefixScanner);
    }
    @isTest static void testFindingIds() {
        KeyPrefixScanner.Payload payload = new KeyPrefixScanner.Payload();
        KeyPrefixScanner.findKeys(payload);
        System.assertEquals('001', payload.values[0].keyPrefix);
        System.assertEquals('Account', payload.values[0].apiName);
    }
    @isTest static void testRolloverLogic() {
        KeyPrefixScanner.Payload payload = new KeyPrefixScanner.Payload();
        payload.value3 = 61;
        payload.value2 = 61;
        payload.value1 = 61;
        KeyPrefixScanner.findKeys(payload);
        System.assertEquals(0, payload.value3);
        System.assertEquals(0, payload.value2);
        System.assertEquals(62, payload.value1);
    }
}