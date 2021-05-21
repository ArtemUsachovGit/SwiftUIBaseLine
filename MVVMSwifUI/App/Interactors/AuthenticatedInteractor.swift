//
//  AuthenticatedInteractor.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation

class AuthenticatedInteractor {
    struct Dependencies {
        let api: APIClient
    }
    
    let dp: Dependencies
    
    init(dp: Dependencies) {
        self.dp = dp
    }
    
    func logout() {
        dp.api.logout()
    }
}
