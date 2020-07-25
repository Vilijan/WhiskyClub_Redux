struct CalendarActions {
    
    struct AddWeeklyWhisky: Action, Descriptionable {
        
        var description: String = "CalendarActions.AddWeeklyWhisky"
        
        let weeklyWhisky: WeeklyWhisky
    }

}
