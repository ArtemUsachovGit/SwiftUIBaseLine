//
//  AuhtenticatedView.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 18.05.2021.
//

import SwiftUI
import Stinsen

struct AuhtenticatedView<ViewModel>: View where ViewModel: AuthenticatedViewModel {
    
    @StateObject var vm: ViewModel
    @EnvironmentObject var main: ViewRouter<MainCoordinator.Route>
    
    var body: some View {
        VStack {
            Text("Hello, \(vm.userName)!")
            Button("Logout", action: {
                vm.action.logout(completion: showLoginScreen)
            })
        }
        
    }
}

struct AuhtenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(name: "test name")
        AuthenticatedModule.build(input: .init(user: user))
    }
}

extension AuhtenticatedView {
    func showLoginScreen() {
        main.route(to: .unauthenticated)
    }
}
