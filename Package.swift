// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swift-module-flags: -target arm64-apple-ios13.0

import PackageDescription

let package = Package(
    name: "SLProtofiles",
    products: [
        .library(
            name: "SLProtofiles",
            targets: ["SLProtofilesRelease"]),
    ],
    dependencies: [
        .package(url: "git@github.com:mxcl/PromiseKit.git", from: "6.0.0"),
        .package(url: "git@github.com:StreamLayer/grpc-swift.git", from: "1.16.1"),
    ],
    targets: [
        .target(
            name: "SLProtofilesRelease",
            dependencies: [
              .target(name: "SLProtofilesWrapper")
            ]),
        .target(
          name: "SLProtofilesWrapper",
          dependencies: [
            .product(name: "GRPC", package: "grpc-swift"),
            .target(name: "SLProtofiles"),
          ],
          path: "SwiftPM-PlatformExclude/SLProtofilesWrapper"
        ),
        .binaryTarget(
            name: "SLProtofiles",
            url: "https://dl.dropboxusercontent.com/s/l3dtq55hlnhgrw8/SLProtofiles.xcframework.zip?dl=0",
            checksum: "a7a41c6abee9cf28963b3aafc8c1a98e88d4550d19dfa2614d5951eade8c9d23"
        ),
    ]
)
