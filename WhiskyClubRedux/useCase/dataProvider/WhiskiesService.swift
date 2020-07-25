//  Created by Vilijan Monev on 10/21/19.

import Foundation

protocol WhiskiesService {
    
    func availableWhiskies() -> [Whisky]
    
    func availableWeeklyWhiskies() -> [WeeklyWhisky]
    
    func similarWhiskies(for distillery: Distillery) -> [Whisky]
    
    func add(weeklyWhisky: WeeklyWhisky)
    
    func remove(weeklyWhisky: WeeklyWhisky)
    
}
