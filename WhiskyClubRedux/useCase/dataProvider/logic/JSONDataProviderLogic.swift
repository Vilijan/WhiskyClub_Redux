//  Created by Vilijan Monev on 10/21/19.

import Foundation

struct JSONDataProviderLogic<T: Decodable>: JSONDataProvider {
    typealias ObjectType = T
    
    
    func load<ObjectType: Decodable>(_ filename: String, as type: ObjectType.Type = ObjectType.self) -> ObjectType {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ObjectType.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    
}
