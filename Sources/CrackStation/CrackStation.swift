import Foundation

public class CrackStation: Decrypter {
    var sha1HashDict: Dictionary<String, String> = [:]
    var sha256HashDict: Dictionary<String, String> = [:]

    public required init() {
    }
    
    public func decrypt(shaHash: String) throws -> String? {
        try loadDictionaryFromDisk()
        
        if sha1HashDict.isEmpty {
            throw CrackStationError.dictionaryEmptyError("The Dictionary Passwords file is empty. Please execute the HashGenerator jar to populate the hash file")
        }
        
        if sha1HashDict[shaHash] != nil {
            return sha1HashDict[shaHash]
        } else {
            print("Hash not found")
            return nil
        }
    }
    
    
    private func loadDictionaryFromDisk() throws {
        guard
            let path = Bundle.module.url(forResource: "DictionaryPasswordsSHA1", withExtension: "json")
        else {
            return
        }
        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)

        if let dict: Dictionary = jsonResult as? Dictionary<String, String> {
            sha1HashDict = dict
        }
    }
    
    private enum CrackStationError: Error {
        case dictionaryEmptyError(String)
    }
}
