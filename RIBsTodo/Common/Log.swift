//
//  Logger.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/04.
//

import Foundation
import SwiftyBeaver

// swiftlint:disable type_name
public final class Log {

    // MARK: Properties
    let console: ConsoleDestination = {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d [$C$L$c] $N.$F:$l - $M"
        return console
    }()

    let platform: SBPlatformDestination = {
        let platform = SBPlatformDestination(
            appID: "zLgE5O",
            appSecret: "15ek04stbmfMTjbq3e5tl0jpuhxZv4cs",
            encryptionKey: "ngIeiyF5Scnvh6sZaiqEj5g0sMss0p4o"
        )
        return platform
    }()

    private let log: SwiftBeaverProtocol.Type


    // MARK: Initializing
    init(with log: SwiftBeaverProtocol.Type) {
        self.log = log
        self.log.addDestination(console)
//        self.log.addDestination(platform)
    }


    // MARK: Logging
    public func verbose(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        self.log.verbose(message, file, function, line: line, context: context)
    }

    public func debug(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        self.log.debug(message, file, function, line: line, context: context)
    }

    public func info(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        self.log.info(message, file, function, line: line, context: context)
    }

    public func warning(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        self.log.warning(message, file, function, line: line, context: context)
    }

    public func error(_ message: Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        self.log.error(message, file, function, line: line, context: context)
    }
}
