import Html
import HtmlSnapshotTesting
import PointFreeTestSupport
import Prelude
import SnapshotTesting
import XCTest

@testable import HttpPipeline
@testable import Views

class MetaLayoutTests: TestCase {
  func testMetaTagsWithStyleTag() {

    func view(_: Prelude.Unit) -> Node {
      return [
        .doctype,
        .html(
          .head(.title("Point-Free")),
          .body("Hello world!")
        ),
      ]
    }

    let layoutView = metaLayout(view)

    assertSnapshot(
      matching: layoutView(
        .init(
          description: "A video series on functional programming.",
          image: "http://www.example.com/image.jpg",
          rest: unit,
          title: "Point-Free",
          twitterCard: .summaryLargeImage,
          twitterSite: "pointfreeco",
          type: .website,
          url: "http://www.pointfree.co"
        )
      ),
      as: .html
    )
  }
}
