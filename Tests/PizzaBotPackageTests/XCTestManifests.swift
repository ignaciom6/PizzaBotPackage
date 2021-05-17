import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PizzaBotPackageTests.allTests),
    ]
}
#endif
