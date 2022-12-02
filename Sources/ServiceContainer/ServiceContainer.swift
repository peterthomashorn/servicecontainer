///
/// The facility which provides all service objects.
///
public class ServiceContainer {
    ///
    /// The only service container object you need.
    ///
    public static let shared = ServiceContainer()

    ///
    /// Registry of service implementations and their associated interfaces.
    ///
    private var registeredServiceImplementations = [String: Service.Type]()

    ///
    /// Actually created instances of service implementations.
    ///
    private var createdServiceInstances = [String: any Service]()

    ///
    /// Registers a service object with the associated requirements for injection.
    ///
    public func register(_ service: any Service.Type, for interface: Any.Type) {
        let interfaceDescription = String(describing: interface)
        registeredServiceImplementations[interfaceDescription] = service
    }

    ///
    /// Get a service instance for the given requirements.
    ///
    public func get<T>(_ type: Any.Type) -> T? {
        let interfaceDescription = String(describing: type)

        guard let implementation = registeredServiceImplementations[interfaceDescription] else {
            assertionFailure("No implementation registered for the given interface!")
            return nil
        }

        let implementationDescription = String(describing: implementation)

        if createdServiceInstances[implementationDescription] == nil {
            createdServiceInstances[implementationDescription] = implementation.init()
        }

        return createdServiceInstances[implementationDescription] as? T
    }
}
