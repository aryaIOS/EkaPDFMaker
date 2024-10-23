// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EkaPDFMaker",
    platforms: [
      .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "EkaPDFMaker",
            targets: ["EkaPDFMaker"]),
    ],
    dependencies: [
      .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "5.0.2")),
      .package(url: "git@github.com:eka-care/EkaUI.git", branch: "main"),
      .package(url: "git@github.com:eka-care/PatientUtility.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "EkaPDFMaker",
            dependencies: [
              "SwiftyJSON",
              "EkaUI",
              "PatientUtility"
            ]
        ),
        .testTarget(
            name: "EkaPDFMakerTests",
            dependencies: ["EkaPDFMaker"]
        ),
    ]
)
