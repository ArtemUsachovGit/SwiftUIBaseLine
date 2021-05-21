//
//  LoginModule.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation
import SwiftUI

struct LoginModuleInput {}

enum LoginModule {
    static func build(input: LoginModuleInput) -> LoginView<LoginViewModelImpl> {
        let dp = LoginViewModelImpl.Dependencies(interactor: inject())
        let vm = LoginViewModelImpl(dp: dp, input: input)
        return LoginView<LoginViewModelImpl>(vm: vm)
    }
}
