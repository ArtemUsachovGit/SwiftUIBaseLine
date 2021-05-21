//
//  LoginViewModel.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 17.05.2021.
//

import Foundation
import Combine
import Stinsen

final class LoginViewModelImpl: LoginViewModel {

    @Published var name: String = ""
    @Published var password: String = ""
    
    @Published var isLoading = false
    @Published var submitButtonDisabled = true

    struct Dependencies {
        let interactor: LoginInteractor
    }
    
    var action: LoginViewModelActions {
        return self
    }
    
    private let input: LoginModuleInput
    private let dp: Dependencies
    private var cancellables = Set<AnyCancellable>()
    private var formValidator: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($name, $password)
            .map { name, password in
                //if name or password is empty then we should disable login button
                //return true because we have modifier .disabled for button
                name.isEmpty || password.isEmpty
            }.eraseToAnyPublisher()
    }
    
    init(dp: Dependencies, input: LoginModuleInput) {
        self.input = input
        self.dp = dp
        formValidator
            .assign(to: &$submitButtonDisabled)
    }
    
}

extension LoginViewModelImpl: LoginViewModelActions {
    
    func forgotPassword(completion: @escaping () -> Void) {
        completion()
    }
    
    func login(completion: @escaping (Result<User, Error>) -> Void) {
        isLoading.toggle()
        dp.interactor.login(name: name, password: password)
            .delay(for: .seconds(2), scheduler: RunLoop.main)//for test porposes
            .sink { [weak self] completions in
                self?.isLoading.toggle()
                if case let .failure(error) = completions {
                    completion(.failure(error))
                }
            } receiveValue: { user in
                completion(.success(user))
            }.store(in: &cancellables)
    }
}
