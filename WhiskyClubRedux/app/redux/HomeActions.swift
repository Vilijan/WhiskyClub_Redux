struct HomeActions {
    
    struct GoToCalendar: Action, Descriptionable {
        var description: String = "HomeActions.GoToCalendar"
        let weeklyWhiskies: [WeeklyWhisky]
    }
    
    struct GoToWhiskiesOverview: Action, Descriptionable {
        var description: String = "HomeActions.GoToWhiskiesOverview"
        let whiskies: [Whisky]
    }
    
}
