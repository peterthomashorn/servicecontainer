///
/// The facility which provides all service objects.
///
/// Currently this works based on the assumption services have a global `shared` instance available.
/// This of course could be refined to only register types themselves and lazily create the objects on demand inside this container.
/// That would also enable support of multiple service instances with different configurations for the same requirements.
///
public class ServiceContainer {
    ///
    /// The only service container object you need.
    ///
    public static let shared = ServiceContainer()

    ///
    /// Private registry of service objects and their associated interfaces.
    ///
    private var registeredServices = [String: any Service]()

    ///
    /// Registers a service object with the associated requirements for injection.
    ///
    public func register(_ service: any Service, for interface: Any.Type) {
        let interfaceDescription = String(describing: interface)
        registeredServices[interfaceDescription] = service
    }

    ///
    /// Get a service object for the given requirements.
    ///
    public func get<T>(_ type: Any.Type) -> T? {
        let interfaceDescription = String(describing: type)

        guard let service = registeredServices[interfaceDescription] else {
            assertionFailure("Requested \(interfaceDescription) service but none is available!")
            return nil
        }

        return service as? T
    }
}
