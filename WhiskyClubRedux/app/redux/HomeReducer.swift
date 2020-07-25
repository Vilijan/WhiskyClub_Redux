extension Reducers {
    public static func homeReducer(state: AppState,
                                   action: Action) -> AppState {
        var state = state
        
        print("PREVIOUS STATE:")
        print(state.description)
        print("ACTION:")
        print((action as? Descriptionable)?.description)


        if stateRepository.saveAction {
            stateRepository.arr.append((state, action))
        }
        
        switch action {
        case let action as HomeActions.GoToCalendar:
            state = .calendar(CalendarViewState(weeklyWhiskies: action.weeklyWhiskies))
        case let action as HomeActions.GoToWhiskiesOverview:
            var newState = WhiskiesOverviewViewState()
            newState.whiskies = action.whiskies
            state = .whiskiesOverview(newState)
        default:
            break
        }
        
        switch state {
        case .calendar(let calendarViewState):
            let newState = Reducers.calendarReducer(state: calendarViewState, action: action)
            state = .calendar(newState)
        case .whiskiesOverview(let whiskiesOverviewViewState):
            let newState = Reducers.whiskiesOverviewReducer(state: whiskiesOverviewViewState,
                                                            action: action)
            state = .whiskiesOverview(newState)
        }

        print("CURRENT STATE:")
        print(state.description)
        print()

        return state
    }
}




