//
//  DependencyProvider.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation

final class DependencyProvider {
    private init () {}
    
    static let shared = DependencyProvider()
    
    private let locator = ServiceLocator.shared
    
    func configure() {
        configureCoreDependencies()
        configureInteractors()
    }
}

private extension DependencyProvider {
    
    func configureCoreDependencies() {
        let apiService = APIClient()
        locator.register(service: apiService)
    }
    
    func configureInteractors() {
        locator.register { serviceLocator in
            LoginInteractor(dependencies: LoginInteractor.Dependencies(api: serviceLocator.inject()))
        }
        
        locator.register { serviceLocator in
            AuthenticatedInteractor(dp: AuthenticatedInteractor.Dependencies(api: serviceLocator.inject()))
        }
    }
}

func inject<T>() -> T {
    return ServiceLocator.shared.get()
}
