//
//  LoginViewModel+Interface.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 19.05.2021.
//

import Foundation

protocol LoginViewModelActions {
    func login(completion: @escaping (Result<User, Error>) -> Void)
    func forgotPassword(completion: @escaping () -> Void)
}

protocol LoginViewModel: ObservableObject {
    var name: String { get set }
    var password: String { get set }
    
    var isLoading: Bool { get set }
    var submitButtonDisabled: Bool { get set }
    
    var action: LoginViewModelActions { get }
}
