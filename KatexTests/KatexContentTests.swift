import Katex
import XCTest

class KatekContentTests : XCTestCase {

    func testConvert_WhenEmpty_ReturnsEmptyString() {
        let content = KatexContent(rawContent: "")

        let convertedContent = content.convert()

        XCTAssertEqual("", convertedContent)
    }

    func testConvert_WhenReturningTextWithNoEquations_ReturnsTheOriginalText() {
        let content = KatexContent(rawContent: "This is some text")

        let convertedContent = content.convert()

        XCTAssertEqual("This is some text", convertedContent)
    }

    func testConvert_WhenStringIsOneSymbol_WrapsInSpan() {
        let content = KatexContent(rawContent: "$a$")

        let convertedContent = content.convert()

        XCTAssertEqual("<span class=\"tex\">a</span>", convertedContent)
    }

    func testConvert_WhenStringHasPlainTextAndFormula_WrapsFormula() {
        let content = KatexContent(rawContent: "$a$ b")

        let convertedContent = content.convert()

        XCTAssertEqual("<span class=\"tex\">a</span> b", convertedContent)
    }

}
