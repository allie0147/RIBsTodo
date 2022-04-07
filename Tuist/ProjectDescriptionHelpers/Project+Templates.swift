import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

public extension TargetDependency {
    static let ribs: TargetDependency = .external(name: "RIBs")
    static let alamofire: TargetDependency = .external(name: "Alamofire")
    static let rxSwift: TargetDependency = .external(name: "RxSwift")
    static let rxCocoa: TargetDependency = .external(name: "RxCocoa")
    static let snapKit: TargetDependency = .external(name: "SnapKit")
    static let then: TargetDependency = .external(name: "Then")
    static let lottieios: TargetDependency = .external(name: "Lottie")
    static let kingfisher: TargetDependency = .external(name: "Kingfisher")
    static let swiftyBeaver: TargetDependency = .external(name: "SwiftyBeaver")
}

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(
        name: String,
        platform: Platform,
        additionalTargets: [String]
    ) -> Project {

        let targets = makeAppTargets(
            name: name,
            platform: platform,
            dependencies: [
                    .ribs,
                    .alamofire,
                    .rxSwift,
                    .rxCocoa,
                    .snapKit,
                    .then,
                    .lottieios,
                    .kingfisher,
                    .swiftyBeaver
            ]
        )

        let schemes = makeAppScheme(name: name)

        let settings = makeAppSettings()

        return Project(name: name,
                       organizationName: "com.allieProject",
                       settings: settings,
                       targets: targets,
                       schemes: schemes)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(
        name: String,
        platform: Platform
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: platform,
            product: .framework,
            bundleId: "com.allieProject.\(name)",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: "\(name)/Supported Files/Info.plist",
            sources: ["\(name)/Sources/**"],
            resources: [],
//            entitlements: "\(name)/\(name).entitlements",
            dependencies: []
        )

        let unitTests = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.allieProject.\(name)Tests",
            infoPlist: .default,
            sources: ["\(name)Tests/**"],
            resources: [],
            dependencies: []
        )

        let uiTests = Target(
            name: "\(name)UITests",
            platform: platform,
            product: .uiTests,
            bundleId: "com.allieProject.\(name)UITests",
            infoPlist: .default,
            sources: ["\(name)UITests/**"],
            resources: [],
            dependencies: []
        )

        return [sources, unitTests, uiTests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(
        name: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen",
            "UILaunchScreen": [:],
            "UIUserInterfaceStyle": "Light",
            "UIStatusBarStyle": "UIStatusBarStyleLightContent",
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait"
            ],
            "UISupportedInterfaceOrientations~ipad": [
                "UIInterfaceOrientationPortrait"
            ],
//            "UIApplicationSceneManifest": [
//                "UIApplicationSupportsMultipleScenes": false,
//                "UISceneConfigurations": [
//                    "UIWindowSceneSessionRoleApplication": [
//                        [
//                            "UISceneConfigurationName": "Default Configuration",
//                            "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
//                        ]
//                    ]
//                ]
//            ]
        ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "com.allieProject.\(name)",
            deploymentTarget: .iOS(targetVersion: "13.0",
                                   devices: [.iphone]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["\(name)/Sources/**"],
            resources: ["\(name)/Resources/**"],
//            entitlements: "\(name)/\(name).entitlements",
            dependencies: dependencies
        )

        let unitTestTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.allieProject.\(name)Tests",
            infoPlist: .default,
            sources: ["\(name)Tests/**"],
            dependencies: dependencies
        )

        let uiTestTarget = Target(
            name: "\(name)UITests",
            platform: platform,
            product: .uiTests,
            bundleId: "com.allieProject.\(name)UITests",
            infoPlist: .default,
            sources: ["\(name)UITests/**"],
            dependencies: dependencies
        )

        return [mainTarget, unitTestTarget, uiTestTarget]
    }

    private static func makeAppScheme(name: String) -> [Scheme] {
        return [
            Scheme(
                name: "\(name)-Debug",
                shared: true,
                buildAction: .buildAction(targets: ["\(name)"]),
                testAction: .targets(["\(name)Tests"]),
                runAction: .runAction(executable: "\(name)"),
                archiveAction: .archiveAction(configuration: ConfigurationName.debug)
            ),
            Scheme(
                name: "\(name)-Release",
                shared: true,
                buildAction: .buildAction(targets: ["\(name)"]),
                runAction: .runAction(executable: "\(name)"),
                archiveAction: .archiveAction(configuration: ConfigurationName.release)
            )
        ]
    }

    private static func makeAppSettings() -> Settings {
        var baseSettings: [String: SettingValue] = [
            "MARKETING_VERSION": "1.0",
            "CURRENT_PROJECT_VERSION": "1.0.0",
            "OTHER_LDFLAGS": "-ObjC",
            "ALWAYS_SEARCH_USER_PATHS": "NO",
            "SWIFT_VERSION": "5.5",
            "BUILD_ACTIVE_ARCHITECTURE_ONLY": "YES",
            "DEVELOPMENT_TEAM": "F7DAHNMXP5",
        ]

//        #if arch(x86_64)
////            "ONLY_ACTIVE_ARCH": "NO",
////                "EXCLUDED_ARCHS": "arm64",
//            baseSettings["ONLY_ACTIVE_ARCH"] = "NO"
//            baseSettings["ARCHS"] = "$(ARCHS_STANDARD)"
////            baseSettings["EXCLUDED_ARCHS"] = "$(ARCHS_STANDARD)"
//        #else
////            baseSettings["ARCHITECTURES"] = "$(ARCHS_STANDARD_32_BIT)"
//            baseSettings["EXCLUDED_ARCHS"] = "$(ARCHS_STANDARD)"
//        #endif
//            "HEADER_SEARCH_PATHS": "../**",
        return .settings(
            base: baseSettings,
            configurations: [.debug(name: .debug),
                                 .release(name: .release)],
            defaultSettings: .recommended)
    }
}

