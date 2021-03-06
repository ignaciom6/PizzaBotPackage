//
//  File.swift
//  
//
//  Created by Ignacio Mariani on 17/05/2021.
//

import Foundation

class Parser {
    
    public func getGridFromArray(grid: [String]) -> Grid? {
        var gridResult: Grid?
                
        if let width = grid.first, width.isNumber, Int(width) ?? 0 > 0,
           let height = grid.last, height.isNumber, Int(height) ?? 0 > 0 {
            gridResult = Grid(width: Int(width) ?? 0, height: Int(height) ?? 0)
        } else {
            gridResult = nil
        }
        return gridResult
    }
    
    public func getPointFromString(coordinate: String) -> Point? {
        let coordinates = getArrayOfCoordinates(coordinate: coordinate)
        
        if coordinates.count == 2, let x = coordinates.first, x.isNumber, let y = coordinates.last, y.isNumber {
            return Point(x: Int(x) ?? 0, y: Int(y) ?? 0)
        } else {
            return nil
        }
    }
    
    private func getArrayOfCoordinates(coordinate: String) -> [String] {
        let cleanCoord = coordinate.replacingOccurrences(of: ")", with: "")
        return cleanCoord.components(separatedBy: CharacterSet.init(charactersIn: ","))
    }
}
