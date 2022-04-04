//
//  Singleton.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/04.
//

import SwiftyBeaver
import Foundation

public let log: Log = {
    #if DEBUG
        let isTesting = NSClassFromString("XCTest") != nil
        return isTesting ? resolveLogForTest() : resolveLogForProduction()
    #else
        return resolveLogForProduction()
    #endif
}()

private func resolveLogForProduction() -> Log {
    return Log(with: SwiftyBeaver.self)
}

#if DEBUG
    private func resolveLogForTest() -> Log {
        return Log(with: SwiftBeaverDummy.self)
    }

    private final class SwiftBeaverDummy: SwiftBeaverProtocol {
        static func addDestination(_ destination: BaseDestination) -> Bool {
            return true
        }

        static func verbose(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
        }

        static func debug(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
        }

        static func info(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
        }

        static func warning(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
        }

        static func error(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?) {
        }
    }
#endif
