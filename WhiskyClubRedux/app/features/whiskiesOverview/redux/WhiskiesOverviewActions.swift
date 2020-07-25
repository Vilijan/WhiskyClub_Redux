struct WhiskiesOverviewActions {
    
    struct WhiskyTapped: Action, Descriptionable {
        var description: String = "WhiskiesOverviewActions.WhiskyTapped"
        
        let whisky: Whisky
    }
    
    struct CategoryChanged: Action, Descriptionable {
        var description: String = "WhiskiesOverviewActions.CategoryChanged"
        
        let index: Int
    }
    
    struct WhiskyDetailsDismissed: Action, Descriptionable {
        var description: String = "WhiskiesOverviewActions.WhiskyDetailsDismissed"
    }
    
}
