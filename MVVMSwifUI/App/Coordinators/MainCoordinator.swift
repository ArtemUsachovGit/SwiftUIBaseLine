//
//  MainCoordinator.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 18.05.2021.
//

import Foundation
import Stinsen
import SwiftUI

class MainCoordinator: ViewCoordinatable {
    
    var children = ViewChild()
    
    enum Route: ViewRoute {
        case unauthenticated
        case authenticated(User)
    }
    
    func resolveRoute(route: Route) -> AnyCoordinatable {
        switch route {
        case .unauthenticated:
            return AnyCoordinatable(
                NavigationViewCoordinatable(
                    UnauthenticatedCoordinator()
                )
            )
        case .authenticated(let user):
            return AnyCoordinatable(
                AuthenticatedCoordinator(user: user)
            )
        }
    }
    
    @ViewBuilder func start() -> some View {
        LoadingScreen()
    }
}
