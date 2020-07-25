import SwiftUI

let weeklyWhiskies = [
    WeeklyWhisky(whiskyName: "Lagavulin 16", imageName: "blank_whisky1"),
    WeeklyWhisky(whiskyName: "Glefiddich 18 Lagavulin 16", imageName: "blank_whisky3"),
    WeeklyWhisky(whiskyName: "Jura 10", imageName: "blank_whisky2")
]

struct WeeklyWhisky: Identifiable {
    
    var id = UUID()
    
    var whiskyName: String
    
    var imageName: String
    
}
