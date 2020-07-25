import SwiftUI

struct WhiskyDetailsView: View {
    @EnvironmentObject var store: Store
    
    var state: WhiskyDetailsViewState {
        return whiskyDetailsViewStateProvider(appState: store.appState)
    }
    
    var whisky: Whisky {
        return state.whisky
    }
    
    @State private var imageDetails = false
    
    private let blurRadius: CGFloat = 20
    
    var body: some View {
       GeometryReader { geo in
            
            ZStack(alignment: .top) {
                VStack {
                    HStack {
                        WhiskyNameDetails(whisky: self.whisky,
                                          alignment: .leading,
                                          largeText: true)
                        Spacer()
                    }
                    .blur(radius: self.imageDetails ? self.blurRadius : 0)
                    
                    self.whisky.image
                        .resizable()
                        .frame(width: geo.size.width * (self.imageDetails ? 0.9 : 0.7),
                               height: geo.size.height * (self.imageDetails ? 0.9 : 0.4))
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            self.imageDetails.toggle()
                    }
                    
                    Text(self.whisky.tastingNotes ?? "")
                        .font(.subheadline)
                        .italic()
                        .blur(radius: self.imageDetails ? self.blurRadius : 0)
                    
                }
                .padding()
                .zIndex(self.imageDetails ? 1 : 0)
                
                DistilleryDetails(distillery: self.whisky.distilery)
                    .blur(radius: self.imageDetails ? self.blurRadius : 0)
            }
            .background(LinearGradient.mainBackground)
            .animation(.easeInOut)
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
}
