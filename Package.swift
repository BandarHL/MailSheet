// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MailSheet",
    platforms: [
        .iOS(.v15)
    ], products: [
        .library(
            name: "MailSheet",
            targets: ["MailSheet"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MailSheet",
            dependencies: []
        )
    ],
    swiftLanguageVersions: [.v5]
)
