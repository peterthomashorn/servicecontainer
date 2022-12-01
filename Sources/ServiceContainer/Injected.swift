///
/// Convenience wrapper for the service container query for the associated service requirement.
///
@propertyWrapper public struct Injected<T> {
    public var wrappedValue: T? {
        get {
            ServiceContainer.shared.get(T.self)
        }
    }

    ///
    /// Mandatory initializer for public struct.
    ///
    public init() {}
}
