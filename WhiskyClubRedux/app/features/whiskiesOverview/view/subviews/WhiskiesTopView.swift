import SwiftUI

struct WhiskiesOverviewTopView: View {
    
    @EnvironmentObject var store: Store
    
    var state: WhiskiesOverviewViewState {
        whiskiesOverviewStateProvider(appState: store.appState)
    }
    
    private let interactions = dependency.whiskiesOverviewInteraction
    
    var categoriesNames: [String] {
        return state.categories
    }
    
    var body: some View {
        let selectedIndex: Binding<Int> = .init(get: { () -> Int in
            self.state.selectedCategoryIndex
        }) { newIndex in
            self.interactions.categoryChanged(newIndex)
        }
        
        return VStack {
            
            WhiskyClubImageView(imageName: "whiskies_home",
                                text: "Whiskies in Netcetera")
           
            Picker(selection: selectedIndex.animation(),
                   label: Text("Whisky categorization")) {
                    ForEach(0..<self.categoriesNames.count) { index in
                        Text(self.categoriesNames[index]).tag(index)
                    }
            }.pickerStyle(SegmentedPickerStyle())
                .frame(width: 300)
                .padding()
        }
        .frame(height: 370)
        .background(Color.secondaryFirst)
        .cornerRadius(20)
        .shadow(radius: 10)
    
    }
}
