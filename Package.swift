// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.


//
//  Package.swift
//  IBSKit
//
//  Created by Dimka Novikov on 22.03.2022.
//  Copyright © 2022 IBS. All rights reserved.
//


// MARK: Import section

import PackageDescription



// MARK: - IBSKit Swift Package · Swift Package Manager

// Creating a global package constant
let package = Package(

    // Package name
    name: "IBS SDK",

    // Supported platforms
    platforms: [
        .iOS(.v13)
    ],

    // Released frameworks
    products: [
        .library(name: "IBS SDK",
                 targets: ["IBSKit"])
    ],

    // Package targets
    targets: [
        .binaryTarget(name: "IBSKit",
                      path: "./XCFramework/IBSKit.xcframework")
    ],

    // Supported versions of the Swift language
    swiftLanguageVersions: [
        .v5
    ],

    // Supported C language version
    cLanguageStandard: .c18,

    // Supported C++ language version
    cxxLanguageStandard: .cxx20

)
