# Service Container

A simple proof-of-concept service container as a Swift package to register implementation instances for requirement protocols to be conveniently retrieved through an implicitly injected property.

Basically it boils down to this:

```swift
// Register a service before continueing with the actual business logic of your app.

ServiceContainer.shared.register(AccountManager.shared, for: AccountManaging.self)

// Fetch the registered object

class App {
    @Injected var accountManager: AccountManaging?

    func run() {
        accountManager?.signIn()
    }
}

```
