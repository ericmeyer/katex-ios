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

    func testParser_WhenEndsWithASymbol_ReturnsTwoParts() {
        let parser = KatexParser(rawContent: "a $b$")

        let parts = parser.parse()

        XCTAssertEqual(2, parts.count)
        XCTAssertFalse(parts[0].isFormula)
        XCTAssertEqual("a ", parts[0].text)
        XCTAssertTrue(parts[1].isFormula)
        XCTAssertEqual("b", parts[1].text)
    }

    func testParser_ParsesAComplexExample() {
        let parser = KatexParser(rawContent: "a b $c d$ e $f g$ h $i$ j")

        let parts = parser.parse()

        XCTAssertEqual(7, parts.count)
        XCTAssertFalse(parts[0].isFormula)
        XCTAssertEqual("a b ", parts[0].text)
        XCTAssertTrue(parts[1].isFormula)
        XCTAssertEqual("c d", parts[1].text)
        XCTAssertFalse(parts[2].isFormula)
        XCTAssertEqual(" e ", parts[2].text)
        XCTAssertTrue(parts[3].isFormula)
        XCTAssertEqual("f g", parts[3].text)
        XCTAssertFalse(parts[4].isFormula)
        XCTAssertEqual(" h ", parts[4].text)
        XCTAssertTrue(parts[5].isFormula)
        XCTAssertEqual("i", parts[5].text)
        XCTAssertFalse(parts[6].isFormula)
        XCTAssertEqual(" j", parts[6].text)
    }

}
