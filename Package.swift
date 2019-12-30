// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ConfigurationReader",
    products: [
        .library(
            name: "ConfigurationReader",
            targets: ["ConfigurationReader"]
        )
    ],
    targets: [
        .target(name: "ConfigurationReader")
    ]
)
