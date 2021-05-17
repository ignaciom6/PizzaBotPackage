//
//  File.swift
//  
//
//  Created by Ignacio Mariani on 17/05/2021.
//

import Foundation

enum ValidationError: Error {
    case formatError
    case gridFormatError
    case pointsFormatError
    case outOfBoundsError
    case commandDoesNotExist
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .formatError:
            return NSLocalizedString(
                "Check the format",
                comment: ""
            )
        case .gridFormatError:
            return NSLocalizedString(
                "Grid format is not correct",
                comment: ""
            )
        case .pointsFormatError:
            return NSLocalizedString(
                "Delivery points format is not correct",
                comment: ""
            )
        case .outOfBoundsError:
            return NSLocalizedString(
                "One of your points is out of the grid bounds",
                comment: ""
            )
        case .commandDoesNotExist:
            return NSLocalizedString(
                "Command does not exist",
                comment: ""
            )
        }
    }
}
