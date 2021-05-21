
//  AccountModule.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 21.05.2021.
//

import Foundation
import SwiftUI

struct AccountModuleInput {}

enum AccountModule {
    static func build(input: AccountModuleInput) -> AccountView<AccountViewModelImpl> {
        let dp = AccountViewModelImpl.Dependencies()
        let vm = AccountViewModelImpl(dp: dp, input: input)
        return AccountView<AccountViewModelImpl>(vm: vm)
    }
}
