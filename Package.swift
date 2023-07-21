// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Guanerlin",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "Guanerlin",
            targets: ["Guanerlin"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
        .package(name:"HighlightJSPublishPlugin", url: "https://github.com/alex-ross/highlightjspublishplugin", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "Guanerlin",
            dependencies: [
                "Publish",
                "HighlightJSPublishPlugin",
            ]
        )
    ]
)