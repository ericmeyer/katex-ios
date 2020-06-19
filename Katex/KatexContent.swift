public class KatexContent {

    let rawContent: String

    public init(rawContent: String) {
        self.rawContent = rawContent
    }

    public func convert() -> String {
        let katexParts = KatexParser(rawContent: rawContent).parse()
        return katexParts.map { katexPart in
            if katexPart.isFormula {
                return "<span class=\"tex\">\(katexPart.text)</span>"
            } else {
                return katexPart.text
            }
        }.joined()
    }

}
