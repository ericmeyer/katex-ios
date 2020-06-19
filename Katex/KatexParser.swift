public struct KatexPart {
    public let isFormula: Bool
    public let text: String
}

public class KatexParser {

    private let rawContent : String

    public init(rawContent: String) {
        self.rawContent = rawContent
    }

    public func parse() -> [KatexPart] {
        var parts: [KatexPart] = []
        if !rawContent.isEmpty {
            parts.append(KatexPart(
                isFormula: false,
                text: rawContent
            ))
        }
        return parts
    }
    
}
