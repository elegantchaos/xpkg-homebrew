// swift-tools-version:5.0

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// git@github.com:elegantchaos/xpkg-homebrew - An XPkg package.
// Created by Sam Deane, 19/07/2019.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import PackageDescription

let package = Package(
    name: "xpkg-homebrew",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .executable(name: "xpkg-homebrew-xpkg-hooks", targets: ["xpkg-homebrew-xpkg-hooks"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elegantchaos/XPkgPackage.git", from:"1.0.10"),
    ],
    targets: [
        .target(
            name: "xpkg-homebrew-xpkg-hooks",
            dependencies: ["XPkgPackage"]),
    ]
)
