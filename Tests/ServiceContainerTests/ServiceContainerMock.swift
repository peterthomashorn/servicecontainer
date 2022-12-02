import ServiceContainer

class ServiceContainerMock {
    var getCalls = 0
    var registeredInstances = [String: any Service]()
}

extension ServiceContainerMock: ServiceContaining {
    func register(_ service: Service.Type, for interface: Any.Type) {
        assertionFailure("Not implemented yet!")
        return
    }

    func register(_ service: any Service, for interface: Any.Type) {
        registeredInstances[String(describing: interface)] = service
    }

    func get<T>(_ type: Any.Type) -> T? {
        getCalls += 1
        let interfaceDescription = String(describing: type)
        return registeredInstances[interfaceDescription] as? T
    }
}
