import SwiftUI

struct AddButton: View {
    
    @Binding var buttonPressed: Bool
    
    var body: some View {
        Button(action: { self.buttonPressed.toggle() }) {
            AddIcon()
        }
    }
    
}

struct AddIcon: View {
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 36, height: 36)
            Rectangle()
                .frame(width: 4, height: 26)
                .cornerRadius(20)
            Rectangle()
                .frame(width: 4, height: 26)
                .cornerRadius(20)
                .rotationEffect(Angle(degrees: 90))
        }
        .foregroundColor(Color.primaryVariant)
        
    }
}
