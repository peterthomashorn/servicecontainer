@testable import ServiceContainerExample

class AccountManagerMock {
    var signInCalls = 0
    
    required init() {}
}

extension AccountManagerMock: AccountManaging {
    func signIn() {
        signInCalls += 1
    }
}
