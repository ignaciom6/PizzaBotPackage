import XCTest
import class Foundation.Bundle
@testable import PizzaBotPackage

final class PizzaBotPackageTests: XCTestCase {
    
    let router = Router()
    
    func testOk() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5x5(0,0)(1,3)(4,4)(4,2)(4,2)(0,1)(3,2)(2,3)(4,1)"), "DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD")
    }
    
    func testOkWithExtraSpaces() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5x 5(1,1)(3 ,5)(2, 4)"), "ENDEENNNNDWSD")
    }
    
    func testOkWithCapsX() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5X5(1,1)(3,5)(2,4)"), "ENDEENNNNDWSD")
    }
    
    func testEmptyGrid() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "(2,4)"), ValidationError.gridFormatError.localizedDescription)
    }
    
    func testEmptyPoints() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5x2"), ValidationError.formatError.localizedDescription)
    }
    
    func testOutOfBounds() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "1x1(2,1)"), ValidationError.outOfBoundsError.localizedDescription)
    }
    
    func testLetterInGrid() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "ax2(1,1)"), ValidationError.formatError.localizedDescription)
    }
    
    func testExtraBracket() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5x2((1,1)"), ValidationError.pointsFormatError.localizedDescription)
    }
    
    func testWrongSymbol() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5*2(1,1)"), ValidationError.gridFormatError.localizedDescription)
    }
    
    func testNegativeNumber() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5x2(-1,1)"), ValidationError.pointsFormatError.localizedDescription)
    }
    
    func testExtraCoordinate() {
        XCTAssertEqual(try router.getDeliveryRoute(input: "5x2(1,1,2)"), ValidationError.pointsFormatError.localizedDescription)
    }
}
