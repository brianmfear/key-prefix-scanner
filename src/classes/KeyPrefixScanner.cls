global class KeyPrefixScanner {
    // Response Data
    global class Data {
        global String keyPrefix, apiName;
    }
    // Communications between client and server
    global class Payload {
        global Boolean done = false;
        global Integer value1 = 0, value2 = 0, value3 = 0;
        global Data[] values = new Data[0];
        // Go to the next base62 value
        Boolean increment() {
            value3++;
            if(value3 == 62) {
                value2++;
                value3 = 0;
            }
            if(value2 == 62) {
                value1++;
                value2 = 0;
            }
            return done = value1 == 62;
        }
        // Try to add a new key prefix
        void addPrefix(String key) {
            try {
                Id validId = Id.valueOf(key+'0'.repeat(12));
                SObjectType theType = validId.getSObjectType();
                String apiName = String.valueOf(theType);
                Data entry = new Data();
                entry.keyPrefix = key;
                entry.apiName = apiName;
                values.add(entry);
            } catch(Exception e) {
                // We can't get the API name, or the Id is not valid
            }
        }
    }
    @RemoteAction global static Payload findKeys(Payload source) {
        String[] base62 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
        // Run for about a second, or until we're done
        while(Limits.getCpuTime()<1000 && !source.done) {
            source.addPrefix(base62[source.value1]+base62[source.value2]+base62[source.value3]);
            source.increment();
        }
        return source;
    }
}