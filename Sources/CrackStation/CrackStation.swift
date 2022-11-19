import Foundation

public class CrackStation: Decrypter {
    
    private static let shaHashDict: [String: String] = loadDictionaryFromDisk()
    
    public required init() {
    }
    
    public func decrypt(shaHash: String) -> String? {
        return CrackStation.shaHashDict[shaHash]
    }
    
    private static func loadDictionaryFromDisk() -> [String: String] {
        guard
            let path = Bundle.module.url(forResource: "PasswordsHash", withExtension: "json")
        else {
            return [:]
        }
        
        do {
            let data = try Data(contentsOf: path)
            let jsonResult = try JSONSerialization.jsonObject(with: data)
            
            if let dict: Dictionary = jsonResult as? Dictionary<String, String> {
                return dict
            }
        } catch {
            return [:]
        }
        
        return [:]
    }
}
