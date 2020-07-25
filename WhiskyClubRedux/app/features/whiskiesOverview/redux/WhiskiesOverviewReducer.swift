extension Reducers {
    public static func whiskiesOverviewReducer(state: WhiskiesOverviewViewState,
                                               action: Action) -> WhiskiesOverviewViewState {
        var state = state
        switch action {
        case let action as WhiskiesOverviewActions.WhiskyTapped:
            if state.whiskyState.isWhiskyInPreview(whisky: action.whisky) {
                state.whiskyState = .details(WhiskyDetailsViewState(whisky: action.whisky))
            } else {
                state.whiskyState = .preview(action.whisky)
            }
        case let action as WhiskiesOverviewActions.CategoryChanged:
            state.selectedCategoryIndex = action.index
        case _ as WhiskiesOverviewActions.WhiskyDetailsDismissed:
            state.whiskyState = .overview
        default:
            break
        }
        
        switch state.whiskyState {
        case .details(let whiskyDetailsViewState):
            state.whiskyState = .details(whiskyDetailsReducer(state: whiskyDetailsViewState,
                                                              action: action))
        default:
            break
        }
        
        return state
    }
}
