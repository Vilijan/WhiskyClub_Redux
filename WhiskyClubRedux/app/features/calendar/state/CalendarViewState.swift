struct CalendarViewState: Descriptionable {
    var weeklyWhiskies: [WeeklyWhisky] = []
    
    var description: String {
        return "CalendarViewState"
    }
}

func clanedarStateProvider(appState: AppState) -> CalendarViewState {
    switch appState {
    case .calendar(let state):
        return state
    default:
        return CalendarViewState()
    }
}
