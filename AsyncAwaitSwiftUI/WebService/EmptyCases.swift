//
//  EmptyCases.swift
//  AsyncAwaitSwiftUI
//
//  Created by AnushaValasapalli on 6/24/25.
//

import Foundation
enum errorCases: LocalizedError {
    case InvalidUrl
    case InvalidResponse
    case InvalidData
    var errorDescription: String? {
        switch self {
            case .InvalidUrl: return "Invalid Url found"
            case .InvalidResponse: return "Invalid response found"
            case .InvalidData: return "Invalid data found"
        }
    }
}
