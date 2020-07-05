import Katex
import Quick
import Nimble

class KatexTemplateSpecs: QuickSpec {

    override func spec() {
        describe("Generating content") {
            context("when the template is empty") {
                it("returns an empty string") {
                    let template = KatexTemplate(string: "")

                    let content = template.generate(variables: [:])

                    expect(content).to(equal(""))
                }
            }

            context("when there is only text") {
                it("returns the given text") {
                    let template = KatexTemplate(string: "foo")

                    let content = template.generate(variables: [:])

                    expect(content).to(equal("foo"))
                }
            }

            context("when there are one or more variables") {
                it("replaces one variable that occurs once") {
                    let template = KatexTemplate(string: "$a$")

                    let content = template.generate(variables: [
                        "a": "foo"
                    ])

                    expect(content).to(equal("foo"))
                }

                it("replaces one variable that occurs multiple times") {
                    let template = KatexTemplate(string: "$a$ $a$")

                    let content = template.generate(variables: [
                        "a": "foo"
                    ])

                    expect(content).to(equal("foo foo"))
                }

                it("replaces two variables that each occur once") {
                    let template = KatexTemplate(string: "$a$ $b$")

                    let content = template.generate(variables: [
                        "a": "foo",
                        "b": "bar"
                    ])

                    expect(content).to(equal("foo bar"))
                }
            }
        }
    }

}
