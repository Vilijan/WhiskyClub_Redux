extension Reducers {
    public static func whiskyDetailsReducer(state: WhiskyDetailsViewState,
                                            action: Action) -> WhiskyDetailsViewState {
        var state = state
        
        switch action {
        case let action as WhiskyDetailsActions.ShowDistilleryDetails:
            state.distilleryDetailsState = .fullScreen(action.similarWhiskies)
        case _ as WhiskyDetailsActions.DismissDistilleryDetails:
            state.distilleryDetailsState = .cardView
        default:
            break
        }
        
        return state
    }
}
