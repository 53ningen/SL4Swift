import Foundation

public class Logger {
    
    typealias Writer = (logLevel: LogLevel, string: String, file: String, line: Int, function: String) -> Void
    
    private let logLevel: LogLevel
    private let writer: Writer

    internal static let defaultFormat: String = "[%@] %@:%d <%@> - %@"
    internal static let defaultWriter: (format: String) -> Writer = { (format: String) in {
        (logLevel: LogLevel, string: String, file: String, line: Int, function: String) in
        NSLog(format, logLevel.displayName, file, line, function, string)
        }
    }
    
    internal init(logLevel: LogLevel, writer: Writer) {
        self.logLevel = logLevel
        self.writer = writer
    }
    
    internal convenience init(logLevel: LogLevel) {
        self.init(logLevel: logLevel, writer: Logger.defaultWriter(format: Logger.defaultFormat))
    }
    
    public func isEnabled(logLevel: LogLevel) -> Bool {
        return self.logLevel.level <= logLevel.level
    }
    
    public func isTraceEnabled() -> Bool {
        return logLevel.level >= LogLevel.Trace.level
    }
    
    public func trace(msg: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Trace, string: msg, file: file, function: function, line: line)
    }
    
    public func trace(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [NSObject]) {
        write(.Trace, format: format, file: file, function: function, line: line, objects: arg)
    }
    
    public func trace(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [() -> NSObject]) {
        write(LogLevel.Trace, format: format, file: file, function: function, line: line, arg: arg)
    }
    
    public func trace(msg: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, e: NSError) {
        write(.Trace, msg: msg, e: e, file: file, function: function, line: line)
    }
    
    public func isDebugEnabled() -> Bool {
        return isTraceEnabled() || logLevel == .Debug
    }
    
    public func debug(msg: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Debug, string: msg, file: file, function: function, line: line)
    }
    
    public func debug(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [NSObject]) {
        write(.Debug, format: format, file: file, function: function, line: line, objects: arg)
    }
    
    public func debug(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [() -> NSObject]) {
        write(LogLevel.Debug, format: format, file: file, function: function, line: line, arg: arg)
    }
    
    public func debug(msg: String, e: NSError, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Debug, msg: msg, e: e, file: file, function: function, line: line)
    }
    
    public func isInfoEnabled() -> Bool {
        return isDebugEnabled() || logLevel == .Info
    }
    
    public func info(msg: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Info, string: msg, file: file, function: function, line: line)
    }
    
    public func info(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [NSObject]) {
        write(.Info, format: format, file: file, function: function, line: line, objects: arg)
    }
    
    public func info(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [() -> NSObject]) {
        write(LogLevel.Info, format: format, file: file, function: function, line: line, arg: arg)
    }
    
    public func info(msg: String, e: NSError, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Info, msg: msg, e: e, file: file, function: function, line: line)
    }
    
    public func isWarnEnabled() -> Bool {
        return isInfoEnabled() || logLevel == .Warn
    }
    
    public func warn(msg: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Warn, string: msg, file: file, function: function, line: line)
    }
    
    public func warn(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [NSObject]) {
        write(.Warn, format: format, file: file, function: function, line: line, objects: arg)
    }
    
    public func warn(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [() -> NSObject]) {
        write(LogLevel.Warn, format: format, file: file, function: function, line: line, arg: arg)
    }
    
    public func warn(msg: String, e: NSError, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Warn, msg: msg, e: e, file: file, function: function, line: line)
    }
    
    public func isErrorEnabled() -> Bool {
        return isWarnEnabled() || logLevel == .Error
    }
    
    public func error(msg: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Error, string: msg, file: file, function: function, line: line)
    }
    
    public func error(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [NSObject]) {
        write(.Error, format: format, file: file, function: function, line: line, objects: arg)
    }
    
    public func error(format: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__, arg: [() -> NSObject]) {
        write(LogLevel.Error, format: format, file: file, function: function, line: line, arg: arg)
    }
    
    public func error(msg: String, e: NSError, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        write(.Error, msg: msg, e: e, file: file, function: function, line: line)
    }
    
    private func write(logLevel: LogLevel, format: String, file: String, function: String, line: Int, objects: [NSObject]) {
        write(logLevel, string: String(format: format, arguments: objects), file: file, function: function, line: line)
    }
    
    private func write(logLevel: LogLevel, format: String, file: String, function: String, line: Int, arg: [() -> NSObject]) {
        if isEnabled(logLevel) {
            write(logLevel, format: format, file: file, function: function, line: line, objects: arg.map{ $0() })
        }
    }
    
    private func write(logLevel: LogLevel, msg: String, e: NSError, file: String, function: String, line: Int) {
        write(logLevel, string: String(format: "%@ (%@)", arguments: [msg, e]), file: file, function: function, line: line)
    }
    
    private func write(logLevel: LogLevel, string: String, file: String, function: String, line: Int) {
        if isEnabled(logLevel) {
            writer(logLevel: logLevel, string: string, file: file, line: line, function: function)
        }
    }
    
}
