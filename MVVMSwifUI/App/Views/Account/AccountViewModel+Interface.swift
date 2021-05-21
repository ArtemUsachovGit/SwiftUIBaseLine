
//  AccountViewModel+Interface.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 21.05.2021.
//

import Foundation
import Combine

protocol AccountViewModelActions {
    
}

protocol AccountViewModel: ObservableObject {
        
    var action: AccountViewModelActions { get }
}
