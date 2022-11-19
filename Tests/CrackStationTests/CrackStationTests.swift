import XCTest
import CrackStation
import CryptoKit

final class CrackStationTests: XCTestCase {
    let crackStation = CrackStation()
    
    func testCrackStationWithASingleCharacter() throws {
        let actualPassword = "a"
        let sha1Hash = encrypt_SHA1(actualPassword)
        
        var crackedPassword = crackStation.decrypt(shaHash: sha1Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
        
        let sha256Hash = encrypt_SHA256(actualPassword)
        crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
    }
    
    func testCrackStationWithLoad() throws {
        for a in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
            var actualPassword = String("\(a)")
            var shaHash = encrypt_SHA1(actualPassword)
            
            var crackedPassword = crackStation.decrypt(shaHash: shaHash)
            XCTAssertEqual(crackedPassword, actualPassword)
            
            let sha256Hash = encrypt_SHA256(actualPassword)
            crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
            XCTAssertEqual(crackedPassword, actualPassword)
            
            for b in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
                actualPassword = String("\(a)\(b)")
                shaHash = encrypt_SHA1(actualPassword)
                
                crackedPassword = crackStation.decrypt(shaHash: shaHash)
                XCTAssertEqual(crackedPassword, actualPassword)
                
                let sha256Hash = encrypt_SHA256(actualPassword)
                crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
                XCTAssertEqual(crackedPassword, actualPassword)
                
                for c in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
                    // Given
                    actualPassword = String("\(a)\(b)\(c)")
                    shaHash = encrypt_SHA1(actualPassword)
                    
                    crackedPassword = crackStation.decrypt(shaHash: shaHash)
                    XCTAssertEqual(crackedPassword, actualPassword)
                    
                    let sha256Hash = encrypt_SHA256(actualPassword)
                    crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
                    XCTAssertEqual(crackedPassword, actualPassword)
                }
            }
        }
    }
    
    func testCrackStationWithDoubleCharacters() throws {
        let actualPassword = "g7"
        let sha1Hash = encrypt_SHA1(actualPassword)
        
        var crackedPassword = crackStation.decrypt(shaHash: sha1Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
        
        let sha256Hash = encrypt_SHA256(actualPassword)
        crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
    }
    
    func testCrackStationWithTripleCharacters() throws {
        let actualPassword = "abf"
        let sha1Hash = encrypt_SHA1(actualPassword)
        
        var crackedPassword = crackStation.decrypt(shaHash: sha1Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
        
        let sha256Hash = encrypt_SHA256(actualPassword)
        crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
    }
    
    func testCrackStationWithTripleCharactersAndSymbols() throws {
        let actualPassword = "zx?"
        let sha1Hash = encrypt_SHA1(actualPassword)
        
        var crackedPassword = crackStation.decrypt(shaHash: sha1Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
        
        let sha256Hash = encrypt_SHA256(actualPassword)
        crackedPassword = crackStation.decrypt(shaHash: sha256Hash)
        XCTAssertEqual(crackedPassword, actualPassword)
    }
    
    private func encrypt_SHA1(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 1 digest: "
        let shaHashDescription = String(Insecure.SHA1.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
    }
    
    private func encrypt_SHA256(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 256 digest: "
        let shaHashDescription = String(SHA256.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
    }
}
