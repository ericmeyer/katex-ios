public class KatexContent {

    let rawContent: String

    public init(rawContent: String) {
        self.rawContent = rawContent
    }

    public func convert() -> String {
        return rawContent.replacingOccurrences(of: "$", with: "<span class=\"tex\">")
    }

}
