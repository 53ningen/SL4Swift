import Foundation

public final class LoggerFactory {
    
    private init() {}
    
    public static func getLogger(logLevel: LogLevel) -> Logger {
        return Logger(logLevel: logLevel)
    }
        
}
