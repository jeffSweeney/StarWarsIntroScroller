// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StarWarsScroller",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "StarWarsScroller",
            targets: ["StarWarsScroller"]),
    ],
    targets: [
        .target(name: "StarWarsScroller")
    ]
)
