import XCTest
@testable import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStation() throws {
        let crackStation = CrackStation()
        let actualPassword = try crackStation.crack(password: "12abf551138756adc2a88edc23cb77b1832b7ab8c")
        XCTAssertNotNil(actualPassword)
        XCTAssert("aac".elementsEqual(actualPassword!))
    }
}
