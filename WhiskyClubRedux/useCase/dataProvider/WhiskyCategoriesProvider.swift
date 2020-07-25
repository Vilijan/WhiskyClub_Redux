//
//  WhiskyCategoriesProvider.swift
//  WhiskyClub
//
//  Created by Vilijan Monev on 11/15/19.
//  Copyright © 2019 Vilijan Monev. All rights reserved.
//

import Foundation

protocol WhiskyCategoriesProvider {
    
    func availableCategories() -> [String]
    
}
