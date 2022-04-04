//
//  SwiftBeaverProtocol.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/04/04.
//

import SwiftyBeaver

protocol SwiftBeaverProtocol {
    @discardableResult static func addDestination(_ destination: BaseDestination) -> Bool

    static func verbose(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?)
    static func debug(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?)
    static func info(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?)
    static func warning(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?)
    static func error(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?)
}

extension SwiftyBeaver: SwiftBeaverProtocol { }

