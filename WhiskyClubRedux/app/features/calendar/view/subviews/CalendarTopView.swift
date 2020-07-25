import SwiftUI

struct CalendarTopView: View {
    
    var body: some View {
        VStack {
            WhiskyClubImageView(imageName: "whisky_club_home",
                                text: "Netcetera Whisky club")
            
            Text(clubDescription)
                .font(.system(size: 16,
                              weight: .ultraLight,
                              design: .serif))
                .italic()
                .padding()
                .padding([.leading, .trailing], 15)
            
          
        }
        .background(Color.secondaryFirst)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
}
