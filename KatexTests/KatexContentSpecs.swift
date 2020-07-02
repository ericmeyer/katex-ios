import Katex
import Quick
import Nimble

class KatexContentSpecs : QuickSpec {

    override func spec() {
        describe("Converting text to Katex") {
            context("when given an empty string") {
                it("returns an empty string") {
                    let content = KatexContent(rawContent: "")

                    let convertedContent = content.convert()

                    expect(convertedContent).to(equal(""))
                }
            }

            context("when there are no Katex fragments") {
                it("returns the original string") {
                    let content = KatexContent(rawContent: "This is some text")

                    let convertedContent = content.convert()

                    expect(convertedContent).to(equal("This is some text"))
                }
            }

            context("when there is one symbol") {
                it("returns that symbol in a span") {
                    let content = KatexContent(rawContent: "$a$")

                    let convertedContent = content.convert()

                    expect(convertedContent).to(equal("<span class=\"tex\">a</span>"))
                }
            }

            context("when there is both plaintext and a formula") {
                it("wraps just the formula in a span") {
                    let content = KatexContent(rawContent: "$a$ b")

                    let convertedContent = content.convert()

                    expect(convertedContent).to(equal("<span class=\"tex\">a</span> b"))
                }
            }
        }
    }
}
