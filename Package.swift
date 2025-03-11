//
//  Package.swift
//  MySDK
//
//  Created by Sinda Arous on 25/02/2025.
//


import PackageDescription

// swift-tools-version:5.7
let package = Package(
    name: "MySDK",
    platforms: [
        .iOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/aroussinda/SDKiOS", from: "1.0.0")
    ]
       products: [
           .library(name: "MySDK", targets: ["MySDK"])
       ],
       targets: [
           .target(name: "MySDK", path: "Sources")
       ]
)

