//
//  Whisky.swift
//  WhiskyApp
//
//  Created by Vilijan Monev on 9/22/19.
//  Copyright © 2019 Vilijan Monev. All rights reserved.
//

import SwiftUI
import UIKit

struct Whisky: Hashable, Codable, Identifiable, Equatable {

    var id: Int
    
    var name: String
    
    var distilery: Distillery
    
    var singleMalt: Bool
    
    var blended: Bool
    
    var bourbon: Bool
    
    var mainImage: String
    
    var tastingNotes: String?
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension Whisky {
    
    var imageName: String {
        return mainImage.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var image: Image {
        return Image(uiImage: UIImage(named: imageName) ?? UIImage())
    }
    
    var type: String {
        if singleMalt {
            return "Single malt"
        } else if bourbon {
            return "Bourbon"
        } else {
            return "Blended"
        }
    }
    
    var groupingType: [String] {
        return [distilery.country, type]
    }
    
    func belongs(to category: String) -> Bool {
        return groupingType.contains(category)
    }
}
