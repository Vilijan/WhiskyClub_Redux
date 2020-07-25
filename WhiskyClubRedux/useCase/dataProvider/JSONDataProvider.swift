//  Created by Vilijan Monev on 10/21/19.

import Foundation

protocol JSONDataProvider {
    
    associatedtype ObjectType
    
    func load<ObjectType: Decodable>(_ filename: String, as type: ObjectType.Type) -> ObjectType
    
}
