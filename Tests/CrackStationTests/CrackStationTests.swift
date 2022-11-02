import XCTest
import CrackStation
import CryptoKit

final class CrackStationTests: XCTestCase {
    
    let crackStation = CrackStation()
    
    func testCrackStationWithASingleCharacter() throws {
        let actualPassword = "a"
        let shaHash = encrypt(actualPassword)

        let expectedPassword = crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    func testCrackStationWithLoad() throws {
        for a in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" {
            for b in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" {
                // Given
                let password = String("\(a)\(b)")
                let shaHash = encrypt(password)
                
                // When
                let crackedPassword = crackStation.decrypt(shaHash: shaHash)
                
                // Then
                XCTAssertEqual(crackedPassword, password)
            }
        }
    }
    
    func testCrackStationWithDoubleCharacters() throws {
        let actualPassword = "g7"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    func testCrackStationWithTripleCharacters() throws {
        let actualPassword = "abf"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = crackStation.decrypt(shaHash: shaHash)
        XCTAssertNotNil(actualPassword)
        XCTAssert(actualPassword.elementsEqual(expectedPassword!))
    }
    
    func testCrackStationWithTripleCharactersAndSymbols() throws {
        let actualPassword = "zx?"
        let shaHash = encrypt(actualPassword)
        
        let expectedPassword = crackStation.decrypt(shaHash: shaHash)
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
