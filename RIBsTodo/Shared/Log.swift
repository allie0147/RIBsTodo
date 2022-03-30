//
//  Log.swift
//  RIBsTodo
//
//  Created by Allie Kim on 2022/03/29.
//

import UIKit

// swiftlint:disable type_name
final class Log {

    /// LOG [DEBUG]
    static func d(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG || DEV
            let fileName = file.split(separator: "/").last ?? ""
            let funcName = function.split(separator: "(").first ?? ""
            print("""

            🍏🍏🍏🍏🍏
            [\(fileName)] \(funcName) (line.\(line)): \(msg)
            """)
        #endif
    }

    /// LOG [INFO]
    static func i(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = file.split(separator: "/").last ?? ""
        let funcName = function.split(separator: "(").first ?? ""
        print("""
            
        🍊🍊🍊🍊🍊
        [\(fileName)] \(funcName) (line.\(line)): \(msg)
        """)
    }

    /// LOG [ERROR]
    static func e(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = file.split(separator: "/").last ?? ""
        let funcName = function.split(separator: "(").first ?? ""
        print("""

        🍎🍎🍎🍎🍎
        [\(fileName)] \(funcName) (line.\(line)): \(msg)
        """)
    }
}
