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
            url: "https://dl.dropboxusercontent.com/s/9ghnpafb9sov9e5/SLProtofiles.xcframework.zip?dl=0",
            checksum: "420a31b125383150357970666656ffcd805a0aac5b86478e6dd3b9d6e662e967"
        ),
    ]
)
