enum WhiskyState: Descriptionable {
    case overview
    case preview(Whisky)
    case details(WhiskyDetailsViewState)

    
    func isWhiskyInPreview(whisky: Whisky) -> Bool {
        switch self {
        case .preview(let whiskyForPreview):
            return whisky == whiskyForPreview ? true : false
        default:
            return false
        }
    }
    
    func shouldShowDetails(for whisky: Whisky) -> Bool {
        switch self {
        case .details(let whiskyDetailsState):
            return whiskyDetailsState.whisky == whisky
        default:
            return false
        }
    }
    
    var description: String {
        switch self {
        case .overview:
            return "Overview"
        case .preview(let whisky):
            return "Preview.\(whisky.name)"
        case .details(let viewState):
            return viewState.description
        }
    }
}
