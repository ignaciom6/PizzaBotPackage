//
//  File.swift
//  
//
//  Created by Ignacio Mariani on 16/05/2021.
//

import Foundation

class Router {
    public func getDeliveryRoute(input: String) throws -> String {
        let validator = Validator()
        guard let points = try validator.validateInput(rawInput: input) else {
            throw ValidationError.formatError
        }
                
        return calculateRoute(deliveryPoints: points)
    }
    
    private func calculateRoute(deliveryPoints: [Point]) -> String {
        var route = ""
        var currentPosition = Point(x: 0, y: 0)
        
        deliveryPoints.forEach { dPoint in
            let xMoves = dPoint.x - currentPosition.x
            currentPosition.x = currentPosition.x + xMoves
            let horizontalMoves = String(repeating: (xMoves > 0 ? "E" : "W"), count: abs(xMoves))
            
            let yMoves = dPoint.y - currentPosition.y
            currentPosition.y = currentPosition.y + yMoves
            let verticalMoves = String(repeating: (yMoves > 0 ? "N" : "S"), count: abs(yMoves))
            
            route = route + horizontalMoves + verticalMoves + "D"
        }
        
        return route
    }
}
