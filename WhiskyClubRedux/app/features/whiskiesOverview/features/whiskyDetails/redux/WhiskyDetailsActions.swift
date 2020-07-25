import Foundation

struct WhiskyDetailsActions {
    
    struct ShowDistilleryDetails: Action, Descriptionable {
        var description: String = "WhiskyDetailsActions.ShowDistilleryDetails"
        var similarWhiskies: [Whisky]
    }
    
    struct DismissDistilleryDetails: Action, Descriptionable {
        var description: String = "WhiskyDetailsActions.DismissDistilleryDetails"
    }
    
}
