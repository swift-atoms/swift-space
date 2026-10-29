// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-space",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Space", targets: ["Space"]),
        .library(name: "Space Standard Library Integration", targets: ["Space Standard Library Integration"]),
        .library(name: "Space Foundation Library Integration", targets: ["Space Foundation Library Integration"]),
        .library(name: "Space Test Support", targets: ["Space Test Support"]),
    ],
    traits: [
        .trait(name: "Quantizer", description: "Grid quantization of spatial values"),
        .trait(name: "Scale", description: "Scaling spatial values by dimensionless scale factors"),
        .default(enabledTraits: []),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-quantizer.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-scale.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Space",
            dependencies: [
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Quantizer", package: "swift-quantizer", condition: .when(traits: ["Quantizer"])),
                .product(name: "Scale", package: "swift-scale", condition: .when(traits: ["Scale"])),
            ],
            path: "Sources/Space"
        ),
        .target(
            name: "Space Standard Library Integration",
            dependencies: [
                .target(name: "Space")
            ],
            path: "Sources/Space Standard Library Integration"
        ),
        .target(
            name: "Space Foundation Library Integration",
            dependencies: [
                .target(name: "Space"),
                .target(name: "Space Standard Library Integration"),
            ],
            path: "Sources/Space Foundation Library Integration"
        ),
        .target(
            name: "Space Test Support",
            dependencies: [
                .target(name: "Space")
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Space Tests",
            dependencies: [
                .target(name: "Space"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Quantizer", package: "swift-quantizer", condition: .when(traits: ["Quantizer"])),
                .product(name: "Scale", package: "swift-scale", condition: .when(traits: ["Scale"])),
                .target(name: "Space Test Support"),
                .target(name: "Space Standard Library Integration"),
                .target(name: "Space Foundation Library Integration"),
            ],
            path: "Tests/Space Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableUpcomingFeature("InferIsolatedConformances"),
            .enableExperimentalFeature("Lifetimes"),
            .treatAllWarnings(as: .error),
        ]
}
