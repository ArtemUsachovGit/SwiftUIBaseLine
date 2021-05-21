
//  AccountView.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 21.05.2021.
//

import SwiftUI

struct AccountView<ViewModel>: View where ViewModel: AccountViewModel {
    //ViewModel
    @StateObject var vm: ViewModel
   
    var body: some View {
        Text("Hello world!")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountModule.build(input: .init())
    }
}

extension AccountView {
    /*
     For methods that are related to View
     */
}
