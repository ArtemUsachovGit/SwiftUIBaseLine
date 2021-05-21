//
//  AuhtenticatedViewModel+Interface.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 20.05.2021.
//

import Foundation

protocol AuthenticatedViewModelActions {
    func logout(completion: @escaping () -> Void)
}

protocol AuthenticatedViewModel: ObservableObject {
    var userName: String { get }
    
    var action: AuthenticatedViewModelActions { get }
}
