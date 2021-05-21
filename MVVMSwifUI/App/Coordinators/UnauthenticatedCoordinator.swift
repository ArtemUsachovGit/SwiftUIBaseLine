//
//  UnauthenticatedCoordinator.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 18.05.2021.
//

import Foundation
import Stinsen
import SwiftUI

class UnauthenticatedCoordinator: NavigationCoordinatable {
    
    var navigationStack = NavigationStack()
    
    enum Route: NavigationRoute {
        case forgotPassword
    }
    
    func resolveRoute(route: Route) -> Transition {
        switch route {
        case .forgotPassword:
            return .modal(AnyView(ForgotPasswordView()))
        }
    }
    
    @ViewBuilder func start() -> some View {
        LoginModule.build(input: .init())
    }
}
