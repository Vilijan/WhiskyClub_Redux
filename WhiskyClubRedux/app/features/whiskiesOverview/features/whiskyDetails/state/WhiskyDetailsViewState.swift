struct WhiskyDetailsViewState: Descriptionable {
    var whisky: Whisky
    var distilleryDetailsState: DistilleryDetailsState = .cardView
    
    var description: String {
        return "WhiskyDetils.\(whisky.name).\(distilleryDetailsState.description)"
    }
}

func whiskyDetailsViewStateProvider(appState: AppState) -> WhiskyDetailsViewState {
    let whiskiesOverviewState = whiskiesOverviewStateProvider(appState: appState)
    switch whiskiesOverviewState.whiskyState {
    case .details(let state):
        return state
    default:
        return WhiskyDetailsViewState(whisky: wrongWhisky)
    }
}

let wrongWhisky = Whisky(id: 9999,
                         name: "",
                         distilery: Distillery(id: 22,
                                               name: " ",
                                               country: "",
                                               image: nil),
                         singleMalt: false,
                         blended: true,
                         bourbon: false,
                         mainImage: "blank_whisky1",
                         tastingNotes: nil)

