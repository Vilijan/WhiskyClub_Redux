import SwiftUI

protocol Descriptionable {
    var description: String { get }
}

protocol Action {
    
}

struct Reducers { }

protocol ActionDispatcher {
    func dispatch(action: Action)
}

class Store: ObservableObject, ActionDispatcher {
    @Published var appState: AppState = .calendar(CalendarViewState(weeklyWhiskies: []))
    
    let reducer: (AppState, Action) -> AppState
    
    init(reducer: @escaping (AppState, Action) -> AppState) {
        self.reducer = reducer
    }
    
    //MARK:- ActionDispatcher
    func dispatch(action: Action) {
        appState = reducer(appState, action)
    }
    
}
