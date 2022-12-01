///
/// An example service implementation for the ``AccountManaging`` requirements.
///
final class AccountManager: AccountManaging {
    static var shared: AccountManager = AccountManager()

    func signIn() {
        print("🥳 Signing in...")
    }
}
