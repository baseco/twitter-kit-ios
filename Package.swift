// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TwitterKit",
    platforms: [
        .iOS(.v14) // Adjust the minimum iOS version if necessary
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
            path: "TwitterKit", // Ensure this matches the path to the TwitterKit source folder
            exclude: [
                "Info.plist" // Exclude unnecessary files
            ],
            resources: [
                .process("Resources") // Add if there are resource files
            ],
            publicHeadersPath: "Include" // Adjust if public headers are stored elsewhere
        ),
        .testTarget(
            name: "TwitterKitTests",
            dependencies: ["TwitterKit"],
            path: "Tests" // Adjust if tests are in a different directory
        )
    ]
)