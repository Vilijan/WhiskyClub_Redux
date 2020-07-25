//  Created by Vilijan Monev on 10/21/19.

import UIKit

//TODO: This should be implemented with server.
struct WhiskiesServiceLogic: WhiskiesService {

    private let whiskiesFileName = "whiskies.json"
    
    func availableWhiskies() -> [Whisky] {
        let jsonProvider: JSONDataProviderLogic<Whisky> = JSONDataProviderLogic()
        return jsonProvider.load(whiskiesFileName)
    }
    
    func availableWeeklyWhiskies() -> [WeeklyWhisky] {
        return [
            WeeklyWhisky(whiskyName: "Lagavulin 16", imageName: "blank_whisky1"),
            WeeklyWhisky(whiskyName: "Glefiddich 18 Lagavulin 16", imageName: "blank_whisky3"),
            WeeklyWhisky(whiskyName: "Jura 10", imageName: "blank_whisky2")
        ]
    }
    
    func similarWhiskies(for distillery: Distillery) -> [Whisky] {
        availableWhiskies().filter { $0.distilery.id == distillery.id }
    }
    
    func add(weeklyWhisky: WeeklyWhisky) {
        //TODO:
    }
    
    func remove(weeklyWhisky: WeeklyWhisky) {
        //TODO:
    }

}
