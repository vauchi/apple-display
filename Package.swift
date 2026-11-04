// swift-tools-version: 5.9
// SPDX-FileCopyrightText: 2026 Mattia Egloff <mattia.egloff@pm.me>
// SPDX-License-Identifier: GPL-3.0-or-later

import PackageDescription

let package = Package(
    name: "AppleDisplay",
    platforms: [.iOS(.v15), .macOS(.v14)],
    products: [.library(name: "AppleDisplay", targets: ["AppleDisplay"])],
    targets: [.target(name: "AppleDisplay")]
)
