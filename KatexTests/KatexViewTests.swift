import XCTest
import Katex

enum LoadControllerError: Error {
    case couldNotLoadController
}

class KatexViewTests: XCTestCase {

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

    func testKatexViewHasLabel() throws {
        let controller = try loadController()

        let katexView: KatexView = controller.katexView
        XCTAssertNotNil(katexView.myLabel)
        XCTAssertEqual("Katex View", katexView.myLabel.text)
    }

    func testKatexViewUpdatesLabel() throws {
        let controller = try loadController()

        controller.katexView.update(text: "Foobar")

        XCTAssertEqual("Foobar", controller.katexView.myLabel.text)
    }

}
