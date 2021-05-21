//
//  APIService.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 17.05.2021.
//

import Foundation
import Combine

protocol AuthenticationProtocol {
    func login(name: String, password: String) -> AnyPublisher<User, Error>
}


class APIClient: AuthenticationProtocol {
    
    private var session: URLSession = .shared
    
    func login(name: String, password: String) -> AnyPublisher<User, Error> {
        let random = Bool.random()
        return Future { promise in
            random ? promise(.success(User(name: name))) : promise(.failure(Errors.Login.wrongCredentials))
        }
        .eraseToAnyPublisher()
    }
    
    func logout() {
        
    }
}
