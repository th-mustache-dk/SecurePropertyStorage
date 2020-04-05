import Storage

@propertyWrapper
open class Keychain<Value>: StorePropertyWrapper {

    private var defaultValue: Value!
    
    public convenience init(_ key: StoreKey, defaultValue: Value) {
        self.init(KeychainStorage.standard, key)
        self.defaultValue = defaultValue
    }
    
    open var wrappedValue: Value {
        get { storage.value(forKey: key) ?? self.defaultValue }
        set { storage.set(newValue, forKey: key) }
    }
}

@propertyWrapper
open class KeychainOptional<Value>: StorePropertyWrapper {
    
    public convenience init(_ key: StoreKey) {
        self.init(KeychainStorage.standard, key)
    }
    
    open var wrappedValue: Value? {
        get { storage.value(forKey: key) }
        set { storage.set(newValue, forKey: key) }
    }
}
