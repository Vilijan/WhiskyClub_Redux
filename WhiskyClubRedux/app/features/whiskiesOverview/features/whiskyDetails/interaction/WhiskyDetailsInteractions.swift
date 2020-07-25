protocol WhiskyDetailsInteractions {
    
    func showDetails(for distillery: Distillery)
    
    func dismissDistilleryDetails()
    
}

struct WhiskyDetailsInteractionsLogic: WhiskyDetailsInteractions {
    let actionDispatcher: ActionDispatcher
    let whiskiesService: WhiskiesService
    
    //MARK:- WhiskyDetailsInteractions
    func showDetails(for distillery: Distillery) {
        let similarWhiskies = whiskiesService.similarWhiskies(for: distillery)
        actionDispatcher.dispatch(action: WhiskyDetailsActions.ShowDistilleryDetails(similarWhiskies: similarWhiskies))
    }
    
    func dismissDistilleryDetails() {
        actionDispatcher.dispatch(action: WhiskyDetailsActions.DismissDistilleryDetails())
    }
}
