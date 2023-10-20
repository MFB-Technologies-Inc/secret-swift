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
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "SecretTests",
            dependencies: ["Secret"],
            swiftSettings: swiftSettings
        ),
    ]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("ImplicitOpenExistentials"),
    .enableUpcomingFeature("StrictConcurrency"),
]
