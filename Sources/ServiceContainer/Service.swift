///
/// Base requirements for all services managed by the ``ServiceContainer``.
///
public protocol Service {
    ///
    /// A globally available default object of this service.
    ///
    /// Type properties are lazy by design, thus the service object is instantiated only when needed.
    ///
    static var shared: Self { get }
}
