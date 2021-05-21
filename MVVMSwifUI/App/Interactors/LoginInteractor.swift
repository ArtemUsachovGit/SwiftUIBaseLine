//
//  LoginInteractor.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation
import Combine

class LoginInteractor: Interactor {
    
    struct Dependencies {
        let api: APIClient
    }
    
    let dp: Dependencies
    
    init(dependencies: Dependencies) {
        self.dp = dependencies
    }
    
}

extension LoginInteractor: AuthenticationProtocol {
    func login(name: String, password: String) -> AnyPublisher<User, Error> {
        dp.api.login(name: name, password: password)
    }
}
