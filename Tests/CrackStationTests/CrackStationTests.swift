import XCTest
import CrackStation
import CryptoKit

final class CrackStationTests: XCTestCase {
    
    func testCrackStationWithASingleCharacter() throws {
        let crackStation = CrackStation()
        let actualPassword = "a"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = try crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    func testCrackStationWithDoubleCharacters() throws {
        let crackStation = CrackStation()
        let actualPassword = "g7"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = try crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    func testCrackStationWithTripleCharacters() throws {
        let crackStation = CrackStation()
        let actualPassword = "abf"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = try crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    func testCrackStationWithTripleCharactersAndSymbols() throws {
        let crackStation = CrackStation()
        let actualPassword = "zx?"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = try crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    private func encrypt(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 1 digest: "
        let shaHashDescription = String(Insecure.SHA1.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
    }
}
