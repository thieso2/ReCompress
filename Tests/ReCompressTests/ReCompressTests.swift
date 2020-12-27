import XCTest
@testable import ReCompress

final class ReCompressTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ReCompress().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
