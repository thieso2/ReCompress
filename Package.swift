// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ReCompress",
    platforms: [
        .macOS("10.15")
    ],
    products: [
        .library(
            name: "ReCompress",
            targets: ["ReCompress"]),
        .executable(
            name: "Compress",
            targets: ["Compress"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ReCompress",
            dependencies: []),
        .target(
            name: "Compress",
            dependencies: ["ReCompress", "Progress"]),
    ]
)
