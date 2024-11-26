// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TwitterKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "TwitterKit",
            targets: ["TwitterKit"]
        ),
    ],
    targets: [
        .target(
            name: "TwitterKit",
            path: "TwitterKit",
            exclude: [
                "Info.plist",
                "Resources/en.lproj/InfoPlist.strings", // Exclude specific duplicate resources
                "Resources/*/InfoPlist.strings" // Wildcard to exclude all localized InfoPlist.strings
            ],
            resources: [
                .process("Resources") // Include necessary resources
            ],
            publicHeadersPath: "PublicHeaders",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("PublicHeaders")
            ]
        ),
        .testTarget(
            name: "TwitterKitTests",
            dependencies: ["TwitterKit"],
            path: "Tests"
        )
    ]
)