extension Reducers {
    
    public static func calendarReducer(state: CalendarViewState,
                                       action: Action) -> CalendarViewState {
        var state = state
        
        switch action {
        case let action as CalendarActions.AddWeeklyWhisky:
            state.weeklyWhiskies.append(action.weeklyWhisky)
        default:
            break
        }
        
        return state
    }
    
}
