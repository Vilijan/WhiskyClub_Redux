enum DistilleryDetailsState: Descriptionable {
    case cardView
    case fullScreen([Whisky])
    
    var whiskies: [Whisky] {
        switch self {
        case .fullScreen(let whiskies):
            return whiskies
        default:
            return []
        }
    }
    
    var isCardActive: Bool {
        switch self {
        case .fullScreen(_):
            return true
        default:
            return false
        }
    }
    
    var description: String {
        switch self {
        case .cardView:
            return "DistilleryDetails.CardView"
        case .fullScreen(_):
            return "DistilleryDetails.FullScreen"
        }
        
    }
}


func distilleryDetailsStateProvider(appState: AppState) -> DistilleryDetailsState {
    let whiskyDetailsViewState = whiskyDetailsViewStateProvider(appState: appState)
    
    return whiskyDetailsViewState.distilleryDetailsState
}
