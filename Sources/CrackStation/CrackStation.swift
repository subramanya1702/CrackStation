import Foundation

public class CrackStation: Decrypter {
    
    static var shaHashDict: Dictionary<String, String> = [:]
    
    public required init() {
    }
    
    public func decrypt(shaHash: String) -> String? {
        do {
            if CrackStation.shaHashDict.isEmpty {
                try loadDictionaryFromDisk()
            }
        } catch {
            print("Error while loading the dictionary from the hash files")
        }
        
        return CrackStation.shaHashDict[shaHash]
        
    }
    
    
    private func loadDictionaryFromDisk() throws {
        guard
            let path = Bundle.module.url(forResource: "PasswordsHash", withExtension: "json")
        else {
            return
        }
        
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        
        if let dict: Dictionary = jsonResult as? Dictionary<String, String> {
            CrackStation.shaHashDict = dict
        }
        
        if CrackStation.shaHashDict.isEmpty {
            print("The Dictionary Passwords file is empty. Please execute the HashGenerator jar to populate the hash file")
        }
    }
}
