import SwiftUI

struct WeeklyWhiskies: View {
    
    let weeklyWhiskies: [WeeklyWhisky]
    
    private let interactions = dependency.calendarInteraction
    
    @State private var addingWhisky = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Whiskies of the week")
                    .font(.system(size: 26,
                                  weight: .bold,
                                  design: .serif))
                Spacer()
                
                AddButton(buttonPressed: $addingWhisky)
            }
            
            
            ZStack(alignment: .top) {
                KeyboardHost {
                    WhiskyClubTextField(imageName: "blank_whisky1",
                                        placeholderText: "Whisky name",
                                        cancelAction: {
                                            self.addingWhisky = false
                    }) { newWhisky in
                        self.addingWhisky = false
                        self.interactions.weeklyWhiskyAdded(with: newWhisky)
                    }
                    .animation(.easeInOut)
                    .opacity(addingWhisky ? 1 : 0)
                }
                
                WeeklyWhiskiesList(weeklyWhiskies: weeklyWhiskies)
                    .animation(.easeInOut)
                    .opacity(addingWhisky ? 0 : 1)
            }
            
        }
        .padding()
    }
}

struct WeeklyWhiskiesList: View {
    
    let weeklyWhiskies: [WeeklyWhisky]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(weeklyWhiskies) { weeklyWhisky in
                WeeklyWhiskiesRow(weeklyWhisky: weeklyWhisky)
            }.padding(.top, 10).padding(.bottom, 10)
        }
    }
}

struct WeeklyWhiskiesRow: View {
    let weeklyWhisky: WeeklyWhisky
    
    var body: some View {
        HStack {
            Image(weeklyWhisky.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .background(Color.secondaryFirst)
                .cornerRadius(10)
                .shadow(radius: 2)
            
            VStack(alignment: .leading) {
                Text(weeklyWhisky.whiskyName)
                    .font(.system(size: 20,
                                  weight: .ultraLight,
                                  design: .serif))
                
                Spacer()
                Text("June 3")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                
            }.padding(.leading, 4)
            Spacer()
        }
    }
}
