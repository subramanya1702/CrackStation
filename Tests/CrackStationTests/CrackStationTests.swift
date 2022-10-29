import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStationWithASingleCharacter() throws {
        let crackStation = CrackStation()
        let actualPassword = try crackStation.decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        XCTAssertNotNil(actualPassword)
        XCTAssert("a".elementsEqual(actualPassword!))
    }
    
    func testCrackStationWithDoubleCharacters() throws {
        let crackStation = CrackStation()
        let actualPassword = try crackStation.decrypt(shaHash: "4dab54ebf169cc7b106a91d8118b984b77844919")
        XCTAssertNotNil(actualPassword)
        XCTAssert("g7".elementsEqual(actualPassword!))
    }
    
    func testCrackStationWithTripleCharacters() throws {
        let crackStation = CrackStation()
        let actualPassword = try crackStation.decrypt(shaHash: "4d3ef0bbfc1daba1a476e2734d9776b811b812ef")
        XCTAssertNotNil(actualPassword)
        XCTAssert("abf".elementsEqual(actualPassword!))
    }
    
    func testCrackStationWithTripleCharactersAndSymbols() throws {
        let crackStation = CrackStation()
        let actualPassword = try crackStation.decrypt(shaHash: "bf6e63e9f247d15fa7892fff4291da7c3a34f1c4")
        XCTAssertNotNil(actualPassword)
        XCTAssert("zx?".elementsEqual(actualPassword!))
    }
}
