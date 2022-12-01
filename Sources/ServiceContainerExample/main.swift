import Foundation
import ServiceContainer

// This is global setup which must be run before the actual business logic.
// For every requirement that should be supported by injection an object must be registered.
// See ServiceContainer for further information.

ServiceContainer.shared.register(AccountManager.shared, for: AccountManaging.self)

// This is the actual business logic of an app using this service container solution.

class App {
    @Injected var accountManager: AccountManaging? // All that is necessary to obtain an AccountManager.

    func run() {
        accountManager?.signIn() // Prints "🥳 Signing in..." in the output.
    }
}

let app = App()
app.run()
