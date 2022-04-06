//
//  Dependencies.swift
//  RIBsTodoManifests
//
//  Created by Allie Kim on 2022/04/05.
//
import ProjectDescription

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
            .ribs,
            .alamofire,
            .rxSwift,
            .snapKit,
            .then,
            .lottieios,
            .kingfisher,
            .swiftyBeaver
    ],
    platforms: [.iOS]
)

//var spmDependency: SwiftPackageManagerDependencies = [
//        .ribs,
//        .alamofire,
//        .rxSwift,
//        .snapKit,
//        .then,
//        .lottieios,
//        .kingfisher,
//        .swiftyBeaver
//]

public extension Package {
    static let ribs: Package = .remote(url: "https://github.com/uber/RIBs", requirement: .exact("0.10.0"))
    static let alamofire: Package = .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.0.0"))
    static let rxSwift: Package = .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .upToNextMinor(from: "5.1.0"))
    static let snapKit: Package = .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.0"))
    static let then: Package = .remote(url: "https://github.com/devxoul/Then", requirement: .upToNextMajor(from: "2.7.0"))
    static let lottieios: Package = .remote(url: "https://github.com/airbnb/lottie-ios", requirement: .upToNextMajor(from: "3.3.0"))
    static let kingfisher: Package = .remote(url: "https://github.com/onevcat/Kingfisher", requirement: .upToNextMajor(from: "5.15.6"))
    static let swiftyBeaver: Package = .remote(url: "https://github.com/SwiftyBeaver/SwiftyBeaver", requirement: .upToNextMajor(from: "1.9.0"))
}

// MARK: SourceFile
public extension SourceFilesList {
    static let sources: SourceFilesList = "RIBsTodo/Sources/**"
    static let tests: SourceFilesList = "RIBsTodoTests/**"
}

// MARK: Resource
public enum ResourceType: String {
//    case xibs = "RIBsTodo/Sources/**/*.xib"
//    case storyboards = "RIBsTodo/Resources/**/*.storyboard"
    case assets = "RIBsTodo/Resources/**"
}

// MARK: Extension
public extension Array where Element == FileElement {
    static func resources(with resources: [ResourceType]) -> [FileElement] {
        resources.map { FileElement(stringLiteral: $0.rawValue) }
    }
}
