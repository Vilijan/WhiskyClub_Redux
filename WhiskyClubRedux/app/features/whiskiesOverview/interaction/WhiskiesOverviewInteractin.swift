protocol WhiskiesOverviewInteraction {
    func whiskyTapped(_ whisky: Whisky)
    func categoryChanged(_ index: Int)
    func whiskyDetailsDismissed()
}

struct WhiskiesOverviewInteractionLogic: WhiskiesOverviewInteraction {
    let actionDispatcher: ActionDispatcher
    
    
    //MARK:- WhiskiesOverviewInteraction
    func whiskyTapped(_ whisky: Whisky) {
        actionDispatcher.dispatch(action: WhiskiesOverviewActions.WhiskyTapped(whisky: whisky))
    }
    
    func categoryChanged(_ index: Int) {
        actionDispatcher.dispatch(action: WhiskiesOverviewActions.CategoryChanged(index: index))
    }
    
    func whiskyDetailsDismissed() {
        actionDispatcher.dispatch(action: WhiskiesOverviewActions.WhiskyDetailsDismissed())
    }
    
}
