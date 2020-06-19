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

    func testConvert_WhenStringIsOneSymbol_ReplacesWithOpeningSpanAndTexClass() {
        let content = KatexContent(rawContent: "$a$")

        let convertedContent = content.convert()

        let startsWithSpan = convertedContent.starts(with: "<span class=\"tex\"")
        XCTAssertTrue(startsWithSpan, "Expected converted string to open a span")
    }

}
