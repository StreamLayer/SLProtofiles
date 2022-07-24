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
            url: "https://dl.dropboxusercontent.com/s/l3dtq55hlnhgrw8/SLProtofiles.xcframework.zip?dl=0",
            checksum: "581e433b2758aca5783a5cb1052e4c148811b35b586fccc231c7f470e23f4024"
        ),
    ]
)
