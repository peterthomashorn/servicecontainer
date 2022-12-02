@testable import ServiceContainerExample
import ServiceContainer
import XCTest

final class AppTests: XCTestCase {
    var accountManager: AccountManagerMock!
    var app: App!

    override func setUp() {
        super.setUp()

        accountManager = AccountManagerMock()
        app = App()
    }

    func testRunWithExplicitlyOverriddenService() {
        app.accountManager = accountManager
        app.run()
        XCTAssertEqual(accountManager.signInCalls, 1)
    }

    func testRunWithImplicitlyOverriddenService() {
        ServiceContainer.shared.register(AccountManagerMock.self, for: AccountManaging.self)
        app.run()

        guard let accountManager = app.accountManager as? AccountManagerMock else {
            XCTFail("Expected account manager mock!")
            return
        }

        XCTAssertEqual(accountManager.signInCalls, 1)
    }
}
