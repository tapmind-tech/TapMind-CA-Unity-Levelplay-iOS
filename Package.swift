// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TapMindISAdapter",
    platforms: [
        .iOS(.v13) // The minimum iOS version your SDK supports
    ],
    products: [
        // This is what users will see when they add the package
        .library(
            name: "TapMindISAdapter",
            targets: ["TapMindISAdapterTarget"])
    ],
    dependencies: [
        // Google Mobile Ads official Swift Package
        .package(
            url: "https://github.com/kishantuvoc/TapMindSDK.git",
            from: "1.1.2"
        )
        //.package(url: "https://github.com/ironsource-mobile/ios-sdk.git", .upToNextMajor(from: "9.3.0"))
    ],
    targets: [
        // 1. The actual binary framework
        .binaryTarget(
            name: "TapMindISAdapterBinary",
            path: "TapMindISAdapter.xcframework"
        ),
        // 2. The wrapper target that bridges your binary and Google Mobile Ads
        .target(
            name: "TapMindISAdapterTarget",
            dependencies: [
                .target(name: "TapMindISAdapterBinary"),
                .product(name: "TapMindSDK", package: "TapMindSDK")
//                .product(name: "IronSourceSDK", package: "ios-sdk")
            ],
            path: "Sources/TapMindISAdapter" // Points to your physical folder
        )
    ]
)
