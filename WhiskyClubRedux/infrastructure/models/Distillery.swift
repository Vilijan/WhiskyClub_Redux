//  Created by Vilijan Monev on 9/22/19.

import Foundation

struct Distillery: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var name: String
    
    var country: String
    
    var image: String?
}
