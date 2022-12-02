@testable import ServiceContainerExample
import XCTest

final class AppTests: XCTestCase {
    var accountManager: AccountManagerMock!
    var app: App!

    override func setUp() {
        super.setUp()

        accountManager = AccountManagerMock()

        app = App()
        app.accountManager = accountManager
    }

    // Named this way because: Method 'testRun()' with Objective-C selector 'testRun' conflicts with getter for 'testRun' from superclass 'XCTest' with the same Objective-C selector
    func testAppRun() {
        app.run()
        XCTAssertEqual(accountManager.signInCalls, 1)
    }
}
