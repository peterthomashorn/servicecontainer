///
/// A facility which registers service requirements and their implementations and manages the instances of those.
///
public protocol ServiceContaining {
    ///
    /// Registers a service object with the associated requirements for injection.
    ///
    func register(_ service: any Service.Type, for interface: Any.Type)

    ///
    /// Get a service instance for the given requirements.
    ///
    func get<T>(_ type: Any.Type) -> T?
}
