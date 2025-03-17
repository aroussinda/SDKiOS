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
    resources: [
        .process("Resources")
    ]
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "MySDK", targets: ["MySDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/aroussinda/SDKiOS.git", .exact("1.0.0"))
    ],
    targets: [
        .target(name: "MySDK",
                dependencies: [],
                path: "MySDK",
                sources: ["MySDKManager.swift", "MySDKLocationManager.swift"], // Include both files here
               )
    ]
)

