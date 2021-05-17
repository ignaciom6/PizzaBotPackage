//
//  File.swift
//  
//
//  Created by Ignacio Mariani on 16/05/2021.
//

import Foundation

class Validator {
    
    let parser = Parser()
    
    public func validateInput(rawInput: String) throws -> [Point]? {
        var result: [Point]?
        let input = rawInput.lowercased().replacingOccurrences(of: " ", with: "")
        
        let gridSizeAndDeliveryArray = input.components(separatedBy: CharacterSet.init(charactersIn: "("))
        
        let validatedGrid = try validateGridFormat(gridString: gridSizeAndDeliveryArray.first ?? "")
        let validatedDeliveryPoints = try validateDeliveryPointsFormat(deliveryPoints: Array(gridSizeAndDeliveryArray.dropFirst()))
        
        if (validatedGrid != nil) && validatedDeliveryPoints?.count ?? 0 > 0 {
            if pointsAreWithinGrid(points: validatedDeliveryPoints, grid: validatedGrid) {
                result = validatedDeliveryPoints ?? []
            } else {
                throw ValidationError.outOfBoundsError
            }
        } else {
            throw ValidationError.formatError
        }
        return result
    }
    
    private func validateGridFormat(gridString: String) throws -> Grid? {
        let gridXY = gridString.components(separatedBy: CharacterSet.init(charactersIn: "x"))
        guard gridXY.count == 2 else {
            throw ValidationError.gridFormatError
        }
        return parser.getGridFromArray(grid: gridXY)
    }
    
    private func validateDeliveryPointsFormat(deliveryPoints: [String]) throws -> [Point]? {
        let deliveryPointsResult = try deliveryPoints.compactMap({ (coord) throws -> Point? in
            guard coord.contains(")") else {
                throw ValidationError.pointsFormatError
            }
            return parser.getPointFromString(coordinate: coord)
        })
        
        if deliveryPointsResult.count != deliveryPoints.count {
            throw ValidationError.pointsFormatError
        }
        return deliveryPointsResult
    }
    
    func pointsAreWithinGrid(points: [Point]?, grid: Grid?) -> Bool {
        var withinGrid = true
        
        guard let points = points, let grid = grid else { return false }
        
        for point in points {
            if point.x > grid.width || point.y > grid.height {
                withinGrid = false
                break
            }
        }
        
        return withinGrid
    }
}

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
