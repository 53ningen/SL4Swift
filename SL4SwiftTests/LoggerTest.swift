import SL4Swift
import XCTest

class LoggerTest: XCTestCase {
    
    func testExample() {
        let logger = LoggerFactory.getLogger(.INFO)
        logger.info("logger test")
        logger.trace("hogehogehohgeu")
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
