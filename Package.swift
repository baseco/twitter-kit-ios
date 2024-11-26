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
                "Resources/en.lproj/InfoPlist.strings", // Exclude duplicate resources
                "Resources" // Exclude unnecessary resources if needed
            ],
            resources: [
                .process("Resources")
            ],
            publicHeadersPath: "PublicHeaders", // Adjust if headers are elsewhere
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("PublicHeaders") // Add your headers path
            ]
        ),
        .testTarget(
            name: "TwitterKitTests",
            dependencies: ["TwitterKit"],
            path: "Tests"
        )
    ]
)