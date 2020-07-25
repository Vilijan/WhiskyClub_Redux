import SwiftUI

struct Home: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack {
            
            if store.appState.isShowingCalendar {
                 WhiskyCalendar()
            }
            
            CustomTabView()
                .zIndex(1)
          
            if !store.appState.isShowingCalendar {
                WhiskiesOverview()
            }

        }
        .animation(.easeInOut)
    }
    
}



