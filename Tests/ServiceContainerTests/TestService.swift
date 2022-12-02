import Foundation
import ServiceContainer

protocol TestServiceProtocol: Service {
    var identifier: String { get }
}

class TestService: TestServiceProtocol {
    var identifier: String

    required init() {
        identifier = UUID().uuidString
    }
}
