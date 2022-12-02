// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ServiceContainer",
    products: [
        .executable(name: "ServiceContainerExample", targets: ["ServiceContainerExample"]),
        .library(name: "ServiceContainer", targets: ["ServiceContainer"])
    ],
    targets: [
        .executableTarget(name: "ServiceContainerExample", dependencies: ["ServiceContainer"]),
        .target(name: "ServiceContainer"),
        .testTarget(name: "ServiceContainerExampleTests", dependencies: ["ServiceContainerExample"]),
        .testTarget(name: "ServiceContainerTests", dependencies: ["ServiceContainer"]),
    ]
)
