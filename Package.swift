//
//  Package.swift
//  MySDK
//
//  Created by Sinda Arous on 25/02/2025.
//


// swift-tools-version:6.0
import PackageDescription
let package = Package(
    name: "MySDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "MySDK", targets: ["MySDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/aroussinda/SDKiOS.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "MySDK", dependencies: [], path: "MySDK")
    ]
)

