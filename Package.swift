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
          .package(url: "git@github.com:grpc/grpc-swift.git", from: "1.0.0"),
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
            url: "https://github.com/StreamLayer/SLProtofiles/releases/download/v0.0.0/SLProtofiles.xcframework.zip",
            checksum: "ea8ca09266ce4c0899d93b9eba4cd55112d9742d5aff22d02542346b29bc35d1"
        ),
    ]
)
