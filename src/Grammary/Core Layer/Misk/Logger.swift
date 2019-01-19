//
//  Logger.swift
//  Grammary
//
//  Created by Sergey Grebenozhko on 1/19/19.
//  Copyright © 2019 Сергей Гребеножко. All rights reserved.
//

import Foundation

enum Level {
    case error
    
    var prefix: String {
        switch self {
        case .error:
            return "❗️"
        }
    }
}

func printError(_ message: @autoclosure () -> Any,
                _ file: StaticString = #file,
                _ function: StaticString = #function,
                _ line: Int = #line){
    Logger.log(.error, message, file, function, line)
}


private enum Logger {
    static func log(
        _ level: Level,
        _ message: @autoclosure () -> Any,
        _ file: StaticString = #file,
        _ function: StaticString = #function,
        _ line: Int = #line
        ) {
        
        let fileString = String(describing: file)
            .components(separatedBy: "/").last?
            .replacingOccurrences(of: ".swift", with: "") ?? ""
        let functionString = String(describing: function)
        print("\(Date()) \(fileString).\(functionString) \(threadName()) \(level.prefix): \(message())")
    }
    
    
    private static func threadName() -> String {
        
        #if os(Linux)
        // on 9/30/2016 not yet implemented in server-side Swift:
        // > import Foundation
        // > Thread.isMainThread
        return ""
        #else
        if Thread.isMainThread {
            return ""
        } else {
            let threadName = Thread.current.name
            if let threadName = threadName, !threadName.isEmpty {
                return threadName
            } else {
                return String(format: "%p", Thread.current)
            }
        }
        #endif
    }
}
