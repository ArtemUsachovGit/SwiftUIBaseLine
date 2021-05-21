
//  AccountViewModel.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 21.05.2021.
//

import Foundation
import Combine

final class AccountViewModelImpl: AccountViewModel {
    
    struct Dependencies {
        
    }
    
    var action: AccountViewModelActions {
        return self
    }
    
    private let input: AccountModuleInput
    private let dp: Dependencies
    
    init(dp: Dependencies, input: AccountModuleInput) {
        self.input = input
        self.dp = dp
    }
    
}

extension AccountViewModelImpl: AccountViewModelActions {
    
}
