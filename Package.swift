// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "opentelemetry-swift",
    platforms: [.macOS(.v10_13),
                .iOS(.v11),
                .tvOS(.v11),
                .watchOS(.v3)],
    products: [
        .library(name: "OpenTelemetryApi", type: .static, targets: ["OpenTelemetryApi"]),
        .library(name: "OpenTelemetrySdk", type: .static, targets: ["OpenTelemetrySdk"]),
        .library(name: "SwiftMetricsShim", type: .static, targets: ["SwiftMetricsShim"]),
        .library(name: "DatadogExporter", type: .static, targets: ["DatadogExporter"]),
    ],
    dependencies: [
        .package(name: "Opentracing", url: "https://github.com/undefinedlabs/opentracing-objc", from: "0.5.2"),
        .package(name: "Thrift", url: "https://github.com/undefinedlabs/Thrift-Swift", from: "1.1.1"),
        .package(name: "swift-nio", url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(name: "grpc-swift", url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0"),
        .package(name: "swift-atomics", url: "https://github.com/apple/swift-atomics.git", "0.0.2"..."2.0.0"),
        .package(name: "swift-metrics", url: "https://github.com/apple/swift-metrics.git", from: "2.1.1"),
    ],
    targets: [
        .target(name: "OpenTelemetryApi",
                dependencies: []),
        .target(name: "OpenTelemetrySdk",
                dependencies: ["OpenTelemetryApi",
                               .product(name: "Atomics", package: "swift-atomics")]),
        .target(name: "SwiftMetricsShim",
                dependencies: ["OpenTelemetrySdk",
                               .product(name: "NIO", package: "swift-nio"),
                               .product(name: "CoreMetrics", package: "swift-metrics")],
                path: "Sources/Importers/SwiftMetricsShim",
                exclude: ["README.md"]),
        .target(name: "DatadogExporter",
                dependencies: ["OpenTelemetrySdk"],
                path: "Sources/Exporters/DatadogExporter",
                exclude: ["NOTICE", "README.md"]),
    ]
)
