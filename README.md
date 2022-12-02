# Service Container

A simple proof-of-concept service container as a Swift package to register implementations for interfaces to be conveniently retrieved through an implicitly injected property.

Basically it boils down to this:

```swift
// Register a service before continueing with the actual business logic of your app.

ServiceContainer.shared.register(AccountManager.self, for: AccountManaging.self)

// Fetch the registered object implicitly and lazily through the `@Injected` property wrapper.

class App {
    @Injected var accountManager: AccountManaging?

    func run() {
        accountManager?.signIn()
    }
}

```

The registration enables to set up a service container in unit tests with mocks instead of real implementations only once.
It should save a lot of boilerplate code compared to explicit dependency injection.

## License

See [LICENSE](LICENSE).
