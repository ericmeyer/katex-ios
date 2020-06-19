public struct KatexPart {
    public let isFormula: Bool
    public let text: String
}

enum ParseState {
    case waitingForPart
    case parsingFormula
    case parsingPlainText
}
public class KatexParser {

    private let rawContent : String

    public init(rawContent: String) {
        self.rawContent = rawContent
    }

    public func parse() -> [KatexPart] {
        var state = ParseState.waitingForPart
        var partText = ""
        var parts: [KatexPart] = []

        rawContent.forEach { character in
            switch state {
            case .waitingForPart:
                if character == "$" {
                    state = .parsingFormula
                } else {
                    state = .parsingPlainText
                    partText.append(character)
                }
            case .parsingFormula:
                if character == "$" {
                    parts.append(KatexPart(
                        isFormula: true,
                        text: partText
                    ))
                    partText = ""
                    state = .waitingForPart
                } else {
                    partText.append(character)
                }
            case .parsingPlainText:
                if character == "$" {
                    parts.append(KatexPart(
                        isFormula: false,
                        text: partText
                    ))
                    partText = ""
                    state = .parsingFormula
                } else {
                    partText.append(character)
                }
            }
        }
        if !partText.isEmpty {
            parts.append(KatexPart(
                isFormula: false,
                text: partText
            ))
        }

        return parts
    }
    
}
