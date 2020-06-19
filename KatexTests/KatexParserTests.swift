import Katex
import XCTest

class KatekParserTests : XCTestCase {

    func testParser_WhenEmpty_ReturnsAnEmptyList() {
        let parser = KatexParser(rawContent: "")

        let parts = parser.parse()

        XCTAssertTrue(parts.isEmpty)
    }

    func testParser_WhenIsTextWithNoEquations_ReturnsASingleKatexPart() {
        let parser = KatexParser(rawContent: "String with no equations")

        let parts = parser.parse()

        XCTAssertEqual(1, parts.count)
        XCTAssertFalse(parts[0].isFormula)
        XCTAssertEqual("String with no equations", parts[0].text)
    }

    func testParser_WhenIsTextWithASymbol_ReturnsASingleFormulaPart() {
        let parser = KatexParser(rawContent: "$a$")

        let parts = parser.parse()

        XCTAssertEqual(1, parts.count)
        XCTAssertTrue(parts[0].isFormula)
        XCTAssertEqual("a", parts[0].text)
    }

}
