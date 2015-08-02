import Foundation

public final class LoggerFactory {
    
    private init() {}
    
    public static func getLogger(logLevel: LogLevel) -> Logger {
        return Logger(logLevel: logLevel)
    }
    
    public static func getLogger(logLevel: LogLevel, writer: (logLevel: LogLevel, string: String, file: String, line: Int, function: String) -> Void) -> Logger {
        return Logger(logLevel: logLevel, writer: writer)
    }
        
}
