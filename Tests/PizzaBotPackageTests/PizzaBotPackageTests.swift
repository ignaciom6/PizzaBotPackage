import XCTest
import class Foundation.Bundle
@testable import PizzaBotPackageLib

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
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "(2,4)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.gridFormatError)
        }
    }
    
    func testEmptyPoints() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "5x2")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.formatError)
        }
    }
    
    func testOutOfBounds() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "1x1(2,1)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.outOfBoundsError)
        }
    }
    
    func testLetterInGrid() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "ax2(1,1)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.formatError)
        }
    }
    
    func testExtraBracket() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "5x2((1,1)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.pointsFormatError)
        }
    }
    
    func testWrongSymbol() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "5*2(1,1)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.gridFormatError)
        }
    }
    
    func testNegativeNumber() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "5x2(-1,1)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.pointsFormatError)
        }
    }
    
    func testExtraCoordinate() {
        XCTAssertThrowsError(try router.getDeliveryRoute(input: "5x2(1,1,2)")) { error in
            XCTAssertEqual(error as! ValidationError, ValidationError.pointsFormatError)
        }
    }
}
