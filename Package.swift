// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DLInterval",
    products: [
        .library(
            name: "DLInterval",
            targets: ["DLInterval"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DLInterval",
            dependencies: []),
        .testTarget(
            name: "DLIntervalTests",
            dependencies: ["DLInterval"],
            path: "Tests/DLInterval"),
    ]
)
