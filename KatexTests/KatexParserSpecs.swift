import Quick
import Nimble
import Katex

class KatekParserSpecs : QuickSpec {

    override func spec() {
        func parse(rawContent: String) -> [KatexPart] {
            return KatexParser(rawContent: rawContent).parse()
        }

        describe("Parsing content") {
            context("when it is empty") {
                it("returns an empty list") {
                    let parts = parse(rawContent: "")

                    expect(parts).to(beEmpty())
                }
            }

            context("when it is text with no equations") {
                it("returns a single part") {
                    let parts = parse(rawContent: "String with no equations")

                    expect(parts.count).to(equal(1))
                    expect(parts[0].isFormula).to(beFalse())
                    expect(parts[0].text).to(equal("String with no equations"))
                }
            }

            context("when it is just a symbol") {
                it("returns a single forumla part") {
                    let parts = parse(rawContent: "$a$")

                    expect(parts.count).to(equal(1))
                    expect(parts[0].isFormula).to(beTrue())
                    expect(parts[0].text).to(equal("a"))
                }
            }

            context("when it is text followed by a symbol") {
                it("returns two parts") {
                    let parts = parse(rawContent: "a $b$")

                    expect(parts.count).to(equal(2))
                    expect(parts[0].isFormula).to(beFalse())
                    expect(parts[0].text).to(equal("a "))
                    expect(parts[1].isFormula).to(beTrue())
                    expect(parts[1].text).to(equal("b"))
                }
            }

            context("when it is a complex example") {
                it("has many parts") {
                    let parts = parse(rawContent: "a b $c d$ e $f g$ h $i$ j")

                    expect(parts.count).to(equal(7))
                    expect(parts[0].isFormula).to(beFalse())
                    expect(parts[0].text).to(equal("a b "))
                    expect(parts[1].isFormula).to(beTrue())
                    expect(parts[1].text).to(equal("c d"))
                    expect(parts[2].isFormula).to(beFalse())
                    expect(parts[2].text).to(equal(" e "))
                    expect(parts[3].isFormula).to(beTrue())
                    expect(parts[3].text).to(equal("f g"))
                    expect(parts[4].isFormula).to(beFalse())
                    expect(parts[4].text).to(equal(" h "))
                    expect(parts[5].isFormula).to(beTrue())
                    expect(parts[5].text).to(equal("i"))
                    expect(parts[6].isFormula).to(beFalse())
                    expect(parts[6].text).to(equal(" j"))
                }
            }
        }
    }

}
