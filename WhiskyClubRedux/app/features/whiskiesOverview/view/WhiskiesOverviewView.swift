import SwiftUI

struct WhiskiesOverview: View {
    
    @EnvironmentObject var store: Store
    
    var state: WhiskiesOverviewViewState {
        whiskiesOverviewStateProvider(appState: store.appState)
    }
    
    private var categoryNames: [String] {
        return state.whiskiesPerSubcategory.keys.map { $0 }.sorted()
    }
    
    var body: some View {
        VStack {
            WhiskiesOverviewTopView()
            
            ScrollView {
                VStack {
                    ForEach(categoryNames, id: \.self) { subcategory in
                        WhiskiesSubcategoryRow(subcategoryName: subcategory,
                                               whiskies: self.state.whiskiesPerSubcategory[subcategory]!)
                            .listRowBackground(Color.secondarySecond)
                    }
                }
                .padding(.top, 20)
            }
            .padding(.bottom, 20)
            
        }
        .background(Color.secondarySecond)
        .edgesIgnoringSafeArea(.all)
        .animation(.easeIn)
    }
    
}
