import SwiftUI

struct WhiskiesOverviewViewState: Descriptionable {
    var whiskies: [Whisky] = [] {
        didSet {
            whiskiesPerSubcategory = Dictionary(grouping: whiskies,
                                                by: { $0.groupingType[selectedCategoryIndex] })
        }
    }
    
    var whiskyState: WhiskyState = .overview
    
    var whiskiesPerSubcategory: [String : [Whisky]] = [:]
   
    var categories = ["Country", "Type"]
    
    var selectedCategoryIndex = 0 {
        didSet {
            whiskiesPerSubcategory = Dictionary(grouping: whiskies,
                                                by: { $0.groupingType[selectedCategoryIndex] })
        }
    }
    
    
    var description: String {
        return "WhiskiesOverviewViewState.\(whiskyState.description)"
    }
    
}

func whiskiesOverviewStateProvider(appState: AppState) -> WhiskiesOverviewViewState {
    switch appState {
    case .whiskiesOverview(let state):
        return state
    default:
        // This can be wrapped in outOfScope state.
        return WhiskiesOverviewViewState()
    }
}
