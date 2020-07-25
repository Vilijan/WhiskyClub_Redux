import SwiftUI

struct WhiskyCalendar: View {
    
    @EnvironmentObject var store: Store
    
    var state: CalendarViewState {
        return clanedarStateProvider(appState: store.appState)
    }
    
    
    var body: some View {
        VStack {
            CalendarTopView()
            WeeklyWhiskies(weeklyWhiskies: state.weeklyWhiskies)
               
        }
        .background(Color.secondarySecond)
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut)
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

let clubDescription = """
The Whisky Club is one of the first and finest whisky clubs in North Macedonia. It is happening every Friday in the City Tower kitchen. We enjoy tasting different whiskies while listening to jazz music.
"""
