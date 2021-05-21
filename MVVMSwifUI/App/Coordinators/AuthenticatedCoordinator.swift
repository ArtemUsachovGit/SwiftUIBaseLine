//
//  AuthenticatedCoordinator.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 18.05.2021.
//

import Foundation
import Stinsen
import SwiftUI

class AuthenticatedCoordinator: NavigationCoordinatable {
    
    let user: User
    
    var navigationStack: NavigationStack = NavigationStack()
    
    init(user: User) {
        self.user = user
    }
    
    enum Route: NavigationRoute {
        case push
    }
    
    func resolveRoute(route: Route) -> Transition {
        switch route {
        case .push:
            return .push(AnyView(Text("Hi there")))
        }
    }
    
    @ViewBuilder func start() -> some View {
        let input = AuthenticatedModuleInput(user: user)
        AuthenticatedModule.build(input: input)
    }
}
