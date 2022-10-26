// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
let package = Package(
    name: "TorusUtils",
    platforms: [
        .iOS(.v13),.macOS(.v10_12)
    ],
    products: [
        .library(
            name: "TorusUtils",
            targets: ["TorusUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Perpetual-Altruism-Ltd/fetch-node-details-swift.git", branch: "master"),
        .package(name:"PMKFoundation", url: "https://github.com/PromiseKit/Foundation.git", from: "3.4.0"),
        .package(name:"CryptoSwift", url: "https://github.com/krzyzanowskim/CryptoSwift.git",from: "1.5.1"),
        .package(name:"jwt-kit", url: "https://github.com/vapor/jwt-kit.git", from: "4.0.0"),
        .package(name: "TweetNacl", url: "https://github.com/bitmark-inc/tweetnacl-swiftwrap.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "TorusUtils",
            dependencies: [.product(name: "fetch-node-details-swift", package: "fetch-node-details-swift"), "CryptoSwift", "PMKFoundation", "TweetNacl"]),
        .testTarget(
            name: "TorusUtilsTests",
            dependencies: ["TorusUtils","CryptoSwift",.product(name: "JWTKit", package: "jwt-kit"), "FetchNodeDetails", "PMKFoundation"]),
    ]    
)
