import SwiftUI

struct WhiskyNameDetails: View {
    
    var whisky: Whisky
    
    var alignment: HorizontalAlignment = .center
    
    var largeText = false
    
    var body: some View {
        VStack(alignment: alignment) {
            Text(whisky.name)
                .font(.system(size: largeText ? 26 : 18, weight: .bold, design: .serif))
                .lineLimit(3)
            
            Text(whisky.type)
                .font(.system(size: largeText ? 24: 16, weight: .light, design: .serif))
        }
        .padding()
        .transition(.moveAndScale)
    }
}

extension AnyTransition {
    
    public static var moveAndScale: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}
