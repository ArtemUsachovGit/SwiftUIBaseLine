//
//  AuhtenticatedModule.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation

struct AuthenticatedModuleInput {
    let user: User
}

enum AuthenticatedModule {
    static func build(input: AuthenticatedModuleInput) -> AuhtenticatedView<AuthenticatedViewModelImpl>{
        
        let dp = AuthenticatedViewModelImpl.Dependencies(interactor: inject())
        let vm = AuthenticatedViewModelImpl(dp: dp, input: input)
        return AuhtenticatedView(vm: vm)
    }
}
