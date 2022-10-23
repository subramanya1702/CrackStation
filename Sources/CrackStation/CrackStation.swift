import Foundation

public class CrackStation {
    
    var hashDict: Dictionary<String, String> = [:]

    public init() {
    }
    
    public func crack(password: String) throws -> String? {
        try loadDictionaryFromDisk()
        
        if hashDict.isEmpty {
            print("The hash file is empty. Please run the java program to generate the hash file")
            return nil
        }
        
        if hashDict[password] != nil {
            return hashDict[password]
        } else {
            return nil
        }
    }
    
    private func loadDictionaryFromDisk() throws {
        guard let path = Bundle.module.url(forResource: "DictionaryPasswords", withExtension: "json") else { return }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)

        if let dict: Dictionary = jsonResult as? Dictionary<String, String> {
            hashDict = dict
        }
    }
}
