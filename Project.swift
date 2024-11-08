import ProjectDescription

let project = Project(
    name: "TuistDemo",
    organizationName: "nixzhu",
    options: .options(
        disableSynthesizedResourceAccessors: true
    ),
    targets: [
        .target(
            name: "TuistDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.nixzhu.TuistDemo",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [:],
                "CFBundleShortVersionString": .init(
                    stringLiteral: "1.0.0"
                ),
                "CFBundleVersion": .init(
                    stringLiteral: "1"
                ),
            ]),
            sources: [
                "Targets/TuistDemo/Sources/**",
            ],
            resources: [
                "Targets/TuistDemo/Resources/**",
            ],
            dependencies: [
                .target(name: "Widget"),
            ]
        ),
        .target(
            name: "Widget",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "dev.nixzhu.TuistDemo.Widget",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .extendingDefault(with: [
                "CFBundleDisplayName": "$(PRODUCT_NAME)",
                "CFBundleShortVersionString": .init(
                    stringLiteral: "1.0.0"
                ),
                "CFBundleVersion": .init(
                    stringLiteral: "1"
                ),
                "NSExtension": [
                    "NSExtensionPointIdentifier": "com.apple.widgetkit-extension",
                ],
            ]),
            sources: [
                "Targets/Widget/Sources/**",
            ],
            resources: [
                "Targets/Widget/Resources/Media.xcassets/**",
            ]
        ),
    ]
)
