import SwiftUI

extension Color {
    
    static var primaryVariant: Color {
        return loadColor(name: "PrimaryVarient")
    }
    
    static var secondaryFirst: Color {
        return loadColor(name: "SecondaryFirst")
    }
    
    static var secondarySecond: Color {
        return loadColor(name: "SecondarySecond")
    }
    
    static var darkBackground: Color {
        return loadColor(name: "DarkBackground")
    }
    
    static func loadColor(name: String) -> Color {
        return Color(name)
    }
}


extension LinearGradient {
    
    static var mainBackground: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [.secondaryFirst, .secondarySecond, .secondaryFirst]), startPoint: .top, endPoint: .bottom)
    }
    
}
