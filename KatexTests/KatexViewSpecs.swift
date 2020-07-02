import Katex
import Quick
import Nimble

enum LoadControllerError: Error {
    case couldNotLoadController
}
class KatexViewSpecs: QuickSpec {

    override func spec() {
        func loadController() throws -> KatexViewController {
            let storyboard = UIStoryboard.init(name: "Test", bundle: Bundle.init(for: type(of: self)))
            let controller = storyboard.instantiateViewController(identifier: "KatexViewController") as? KatexViewController
            if let controller = controller {
                controller.loadView()
                return controller
            } else {
                throw LoadControllerError.couldNotLoadController
            }
        }

        describe("Loading the view") {
            it("has a label") {
                let controller = try loadController()

                let katexView = controller.katexView
                expect(katexView).notTo(beNil())
                expect(katexView?.myLabel.text).to(equal("Katex View"))
            }
        }

        describe("Updating the view") {
            it("updates the label") {
                let controller = try loadController()

                controller.katexView.update(text: "Foobar")

                expect(controller.katexView?.myLabel.text).to(equal("Foobar"))
            }
        }
    }

}
