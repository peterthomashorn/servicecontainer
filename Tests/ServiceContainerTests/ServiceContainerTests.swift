import XCTest
@testable import ServiceContainer

final class ServiceContainerTests: XCTestCase {
    var serviceContainer: ServiceContainer!

    override func setUp() {
        super.setUp()
        serviceContainer = ServiceContainer()
    }

    func testGetReturnsTheSameInstance() {
        serviceContainer.register(TestService.self, for: TestServiceProtocol.self)
        let firstResult: TestServiceProtocol? = serviceContainer.get(TestServiceProtocol.self)
        let secondResult: TestServiceProtocol? = serviceContainer.get(TestServiceProtocol.self)
        XCTAssertEqual(firstResult!.identifier, secondResult!.identifier)
    }
}
