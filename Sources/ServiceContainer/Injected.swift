///
/// Convenience wrapper for the service container query for the associated service requirement.
///
@propertyWrapper public struct Injected<T> {
    ///
    /// A cache for the resolved service instance.
    ///
    var serviceInstance: T?

    ///
    /// The service container which is used to retrieve service instances from.
    ///
    var serviceContainer: any ServiceContaining = ServiceContainer.shared

    public var wrappedValue: T? {
        mutating get {
            if serviceInstance == nil {
                serviceInstance = serviceContainer.get(T.self)
            }

            return serviceInstance
        }

        set {
            serviceInstance = newValue
        }
    }

    ///
    /// Mandatory initializer for public struct.
    ///
    public init() {}
}
