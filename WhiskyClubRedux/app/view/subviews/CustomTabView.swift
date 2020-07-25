import SwiftUI

struct CustomTabView: View {
    
    @EnvironmentObject var store: Store
    
    let interactions = dependency.homeInteractions
    
    @State private var index: Double = 0.0
    
    let end = Double(stateRepository.arr.count)
    
    var body: some View {
        let selectedIndex: Binding<Double> = .init(get: { () -> Double in
            return Double(stateRepository.currIndex)
        }) { newIndex in
            stateRepository.update(to: Int(newIndex))
        }
        
        return VStack {
            HStack {
                TabButton(action: interactions.showCalendar,
                          imageName: "home")
                    .opacity(!store.appState.isShowingCalendar ? 1 : 0)
                
                Spacer()
                
                TabButton(action: interactions.showWhiskiesOverview,
                          imageName: "whisky")
                    .opacity(store.appState.isShowingCalendar ? 1 : 0)
            }
            .padding(.top, 40)
            .padding([.leading, .trailing], 10)
            Spacer()
            Slider(value: selectedIndex, in: 0...end, step: 1)
            .padding(.bottom, 50)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabButton: View {
    let action: () -> ()
    let imageName: String
    
    var body: some View {
        Button(action: action) {
            Image(imageName)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .foregroundColor(.primary)
                .cornerRadius(22)
                .shadow(radius: 10, x: 0, y: 10)
        }
    }
}
