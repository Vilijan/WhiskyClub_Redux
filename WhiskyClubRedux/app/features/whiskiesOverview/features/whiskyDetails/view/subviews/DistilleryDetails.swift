import SwiftUI

struct DistilleryDetails: View {
    
    let distillery: Distillery
    
    @EnvironmentObject var store: Store
    
    var state: DistilleryDetailsState {
        return distilleryDetailsStateProvider(appState: store.appState)
    }
    
    private let interactions = dependency.whiskyDetailsInteractions
    
    private var distilleryImage: String {
        if let image = distillery.image {
            return image
        }
    
        return "GlenfiddichDistillery"
    }
    
    private var compressedSizeHeight: CGFloat {
        return (UIScreen.main.bounds.height - UIScreen.main.bounds.height / 3)
    }
    
    var body: some View {
        GeometryReader { geo in
            
            VStack() {
                ZStack(alignment: .bottom) {
                    Image(self.distilleryImage)
                        .resizable()
                        .frame(width: geo.size.width,
                               height: geo.size.height * 0.3)
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.8)
                    Rectangle()
                        .frame(width: geo.size.width, height: 80)
                        .opacity(0.3)
                        .blur(radius: 10)
                    Text("\(self.distillery.name) Distillery")
                        .foregroundColor(.white)
                        .font(.system(size: 24,
                                      weight: .bold,
                                      design: .serif))
                        .lineLimit(2)
                    Rectangle()
                        .frame(width: 60, height: 6)
                        .foregroundColor(Color.primaryVariant)
                        .cornerRadius(3.0)
                        .offset(y: -(geo.size.height * 0.25))
                }
                HStack {
                    Text("Similar whiskies")
                        .font(.system(size: 20,
                                      weight: .bold,
                                      design: .serif))
                    Spacer()
                    
                }
                .padding(.top, 30)
                .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center) {
                        ForEach(self.state.whiskies) { whisky in
                            VStack {
                                whisky.image
                                    .resizable()
                                WhiskyNameDetails(whisky: whisky)
                                
                            }.frame(width: geo.size.width * 0.4,
                                    height: geo.size.height * 0.4)
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(LinearGradient.mainBackground)
        .cornerRadius(state.isCardActive ? 0 : 30)
        .shadow(radius: state.isCardActive ? 0 : 10)
        .offset(y: state.isCardActive ? 0 : compressedSizeHeight - 20)
        .gesture(
            DragGesture()
                .onEnded { value in
                    
                    if value.translation.height > 20 && self.state.isCardActive {
                        self.interactions.dismissDistilleryDetails()
                    }
                    
                    if value.translation.height < 20 && !self.state.isCardActive {
                        self.interactions.showDetails(for: self.distillery)
                    }
                    
            }
        )
        .animation(.easeInOut(duration: 0.4))
    }
    
}
