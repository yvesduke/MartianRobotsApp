//
//  CustomError.swift
//  MartianRobotsApp
//
//  Created by Yves Dukuze on 01/09/2023.
//

import Foundation

enum CustomError: Error {
    case nonSpaceInputError
    case nonNewLineInputError
    case emptyStringInputError
    case invalidInput
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .nonSpaceInputError:
            return NSLocalizedString("Not space found in input string", comment: "nonSpaceInputError")
        case .nonNewLineInputError:
            return NSLocalizedString("Not new line found in input string", comment: "nonNewLineInputError")
        case .emptyStringInputError:
            return NSLocalizedString("Empty input string found", comment: "nonInputError")
        case .invalidInput:
            return NSLocalizedString("Invalid input found", comment: "invaliInput")
        }
    }
}


