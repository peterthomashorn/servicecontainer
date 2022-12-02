import XCTest
@testable import ServiceContainer

final class InjectedTests: XCTestCase {
    var propertyWrapper: Injected<TestServiceProtocol>!
    var serviceContainer: ServiceContainerMock!

    override func setUp() {
        super.setUp()
        serviceContainer = ServiceContainerMock()
        serviceContainer.register(TestService(), for: TestServiceProtocol.self)

        propertyWrapper = Injected<TestServiceProtocol>()
        propertyWrapper.serviceContainer = serviceContainer
    }

    func testGetCallsServiceContainerOnlyOnce() {
        let _ = propertyWrapper.wrappedValue
        let _ = propertyWrapper.wrappedValue
        XCTAssertEqual(serviceContainer.getCalls, 1)
    }
}
