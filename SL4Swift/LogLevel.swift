import Foundation

public struct LogLevel {
    
    public let level: Int
    public let code: String
    public let displayName: String
    
    public static let Trace = LogLevel(level: 10, code: "trace", displayName: "TRACE")
    public static let Debug = LogLevel(level: 20, code: "debug", displayName: "DEBUG")
    public static let Info  = LogLevel(level: 30, code: "info" , displayName: "INFO")
    public static let Warn  = LogLevel(level: 40, code: "warn" , displayName: "WARN")
    public static let Error = LogLevel(level: 50, code: "error", displayName: "ERROR")
    
    private init(level: Int, code: String, displayName: String) {
        self.level = level
        self.code = code
        self.displayName = displayName
    }
    
}

extension LogLevel: Printable {
    public var description: String {
        return "LogLevel{level: \(level),code:\(code),displayName:\(displayName)}"
    }
}

extension LogLevel: Equatable {}
public func ==(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.level == rhs.level
        && lhs.code == rhs.code
        && lhs.displayName == rhs.displayName
}
