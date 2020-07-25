import SwiftUI

struct WhiskyClubTextField: View {
    
    let imageName: String
    
    let placeholderText: String
    
    var cancelAction: (() -> ())? = nil
    
    var doneAction: ((String) -> ())? = nil
    
    @State private var inputText: String = ""
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .background(Color.darkBackground)
                .cornerRadius(10)
                .shadow(radius: 2)
            
            
            TextField(placeholderText, text: $inputText)
                .frame(height: 72)
            
            
            Button(action: {
                self.cancelAction?()
                self.inputText = ""
                UIApplication.shared.endEditing()
            } ) {
                Text("Cancel")
            }
            
            Button(action: {
                self.doneAction?(self.inputText)
                self.inputText = ""
                UIApplication.shared.endEditing()
            } ) {
                Text("Done")
            }
        }
    }
}
