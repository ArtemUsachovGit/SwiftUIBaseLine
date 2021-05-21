//
//  AuhtenticatedViewModel.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation

final class AuthenticatedViewModelImpl: AuthenticatedViewModel {
    
    struct Dependencies {
        let interactor: AuthenticatedInteractor
    }
    
    private let dp: Dependencies
    private let input: AuthenticatedModuleInput
    
    var action: AuthenticatedViewModelActions {
        return self
    }
    
    var userName: String {
        input.user.name
    }
    
    init(dp: Dependencies, input: AuthenticatedModuleInput) {
        self.dp = dp
        self.input = input
    }
}


extension AuthenticatedViewModelImpl: AuthenticatedViewModelActions {
    func logout(completion: @escaping () -> Void) {
        dp.interactor.logout()
        completion  ()
    }
}
