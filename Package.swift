// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "secret-swift",
    products: [
        .library(name: "Secret", targets: ["Secret"]),
    ],
    targets: [
        .target(
            name: "Secret",
            swiftSettings: settings
        ),
        .testTarget(
            name: "SecretTests",
            dependencies: ["Secret"],
            swiftSettings: settings
        ),
    ]
)

let settings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency"),
]
