protocol CalendarInteraction {
    func weeklyWhiskyAdded(with whiskyName: String)
}


struct CalendarInteractionLogic: CalendarInteraction {
    
    let acitonDispatcher: ActionDispatcher
    
    let whiskiesService: WhiskiesService
    
    //MARK:- CalendarInteraction
    func weeklyWhiskyAdded(with whiskyName: String) {
        let newWeeklyWhisky = WeeklyWhisky(whiskyName: whiskyName,
                                           imageName: "blank_whisky2")
        whiskiesService.add(weeklyWhisky: newWeeklyWhisky)
        acitonDispatcher.dispatch(action: CalendarActions.AddWeeklyWhisky(weeklyWhisky: newWeeklyWhisky))
    }
}
