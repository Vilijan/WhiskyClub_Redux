import SwiftUI

struct WhiskyClubImageView: View {
    
    var imageName: String
    
    var text: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Image(self.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: 300)
                Rectangle()
                    .frame(width: geo.size.width, height: 100)
                    .opacity(0.3)
                    .blur(radius: 10)
                HStack {
                    Text(self.text)
                        .frame(width: geo.size.width / 2)
                        .foregroundColor(.white)
                        .font(.system(size: 26,
                                      weight: .bold,
                                      design: .serif))
                        .lineLimit(3)
                    Spacer()
                }
                
            }
        }
        .frame(height: 300)
    }
    
}
