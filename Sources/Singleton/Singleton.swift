import Storage

@propertyWrapper
open class Singleton<Value>: StorePropertyWrapper {
    
    private var defaultValue: Value!
    
    public convenience init(_ key: StoreKey, defaultValue: Value) {
        self.init(SingletonStorage.standard, key)
        self.defaultValue = defaultValue
    }
    
    open var wrappedValue: Value {
        get { storage.value(forKey: key) ?? self.defaultValue }
        set { storage.set(newValue, forKey: key) }
    }
    
}

@propertyWrapper
open class SingletonOptional<Value>: StorePropertyWrapper {
    
    public convenience init(_ key: StoreKey) {
        self.init(SingletonStorage.standard, key)
    }
    
    open var wrappedValue: Value? {
        get { storage.value(forKey: key) }
        set { storage.set(newValue, forKey: key) }
    }
}
