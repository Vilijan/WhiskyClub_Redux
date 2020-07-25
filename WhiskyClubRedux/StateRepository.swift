
class StateRepository {
    var arr = [(AppState, Action)]()
    var currIndex = 0
    var saveAction = true
  
    func next() {
        saveAction = false
        dependency.store.appState = arr[currIndex].0
        dependency.store.dispatch(action: arr[currIndex].1)
        if currIndex + 1 < arr.count {
            currIndex += 1
        }
        
        saveAction = true
    }
    
    func prev() {
        saveAction = false
        dependency.store.appState = arr[currIndex].0
        dependency.store.dispatch(action: arr[currIndex].1)
        if currIndex != 0 {
            currIndex -= 1
        }
        saveAction = true
    }
    
    func update(to: Int) {
        if arr.count == 0 {
            return
        }
        currIndex = to == arr.count ? to - 1 : to
        saveAction = false
        dependency.store.appState = arr[currIndex].0
        dependency.store.dispatch(action: arr[currIndex].1)
        saveAction = true
    }
    
    
    
}

let stateRepository = StateRepository()

