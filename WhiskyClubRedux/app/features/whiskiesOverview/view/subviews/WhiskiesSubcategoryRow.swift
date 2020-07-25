import SwiftUI

struct WhiskiesSubcategoryRow: View {
    
    //MARK:- UI data
    var subcategoryName: String
    
    var whiskies: [Whisky]
    
    @EnvironmentObject var store: Store
    
    var state: WhiskiesOverviewViewState {
        whiskiesOverviewStateProvider(appState: store.appState)
    }
    
    //MARK:- View
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.subcategoryName)
                .font(.system(size: 24,
                              weight: .semibold,
                              design: .serif))
                .padding(10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.whiskies) { whisky in
                        GeometryReader { geometry in
                            WhiskyPreview(whisky: whisky)
                                .frame(width: 200, height: self.previewHeight(for: whisky))
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 15) / -7),
                                                  axis: (x: 10, y: 25, z: 0))
                        }
                        .frame(width: 200)
                        .animation(.easeInOut)
                    }
                }
                .frame(height: 300)
            }
        }
        
    }
    
    private func previewHeight(for whisky: Whisky) -> CGFloat {
        let normalHeight: CGFloat = 250
        let previewHeight: CGFloat = 300
        return state.whiskyState.isWhiskyInPreview(whisky: whisky) ? previewHeight : normalHeight
    }
    
}

struct WhiskyPreview: View {
    
    var whisky: Whisky
    
    @EnvironmentObject var store: Store
    
    var state: WhiskiesOverviewViewState {
        whiskiesOverviewStateProvider(appState: store.appState)
    }
    
    let interaction = dependency.whiskiesOverviewInteraction
    
    var body: some View {
        let whiskyDetails: Binding<Bool> = .init(get: { () -> Bool in
            self.state.whiskyState.shouldShowDetails(for: self.whisky)
        }) { _ in }
        
        return VStack {
            whisky.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    withAnimation {
                        self.interaction.whiskyTapped(self.whisky)
                    }
            }
            if state.whiskyState.isWhiskyInPreview(whisky: whisky) {
                WhiskyNameDetails(whisky: whisky)
            }
        }
        .sheet(isPresented: whiskyDetails, onDismiss: {
            self.interaction.whiskyDetailsDismissed()
        }) {
            WhiskyDetailsView().environmentObject(dependency.store)
        }
    }
    
}
