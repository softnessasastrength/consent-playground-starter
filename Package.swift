// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ConsentPlayground",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .iOSApplication(
            name: "Consent Playground",
            targets: ["ConsentPlaygroundApp"],
            bundleIdentifier: "com.softnessasastrength.consentplayground",
            teamIdentifier: "",
            displayVersion: "0.1",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .heart),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "ConsentPlaygroundApp",
            path: "Sources"
        )
    ]
)
