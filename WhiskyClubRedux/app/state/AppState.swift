enum AppState: Descriptionable {
    case calendar(CalendarViewState)
    case whiskiesOverview(WhiskiesOverviewViewState)
    
    var isShowingCalendar: Bool {
        switch self {
        case .calendar(_):
            return true
        default:
            return false
        }
    }
    
    var description: String {
        switch self {
        case .calendar(let viewState):
            return "AppState.Calendar.\(viewState.description)"
        case .whiskiesOverview(let viewState):
            return "AppState.WhiskiesOverview.\(viewState.description)"
        }
    }
}
