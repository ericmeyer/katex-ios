public class KatexTemplate {
    private let string: String

    public init(string: String) {
        self.string = string
    }

    public func generate(variables: [String:String]) -> String {
        var s = string
        variables.forEach { key, value in
            s = s.replacingOccurrences(of: "$\(key)$", with: value)
        }
        return s
    }
}
