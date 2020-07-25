protocol HomeInteractions {
    func showWhiskiesOverview()
    func showCalendar()
}

struct HomeInteractionsLogic: HomeInteractions {
    let actionDispatcher: ActionDispatcher
    let whiskiesService: WhiskiesService
    
    //MARK:- HomeInteractions
    func showWhiskiesOverview() {
        let whiskies = whiskiesService.availableWhiskies()
        actionDispatcher.dispatch(action: HomeActions.GoToWhiskiesOverview(whiskies: whiskies))
    }
    
    func showCalendar() {
        let weeklyWhiskies = whiskiesService.availableWeeklyWhiskies()
        actionDispatcher.dispatch(action: HomeActions.GoToCalendar(weeklyWhiskies: weeklyWhiskies))
    }
    
}

