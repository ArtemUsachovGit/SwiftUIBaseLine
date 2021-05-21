//
//  LoginErrors.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 19.05.2021.
//

import Foundation

extension Errors {
    enum Login: Error, LocalizedError {
        
        case wrongCredentials
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .wrongCredentials:
                return "Wrong credentials"
            case .unknown:
                return "unknown error"
            }
        }
    }
}
