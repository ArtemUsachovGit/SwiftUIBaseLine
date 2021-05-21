//
//  LoadingScreen.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 18.05.2021.
//

import SwiftUI
import Stinsen

struct LoadingScreen: View {
    @EnvironmentObject var main: ViewRouter<MainCoordinator.Route>
    
    var body: some View {
        VStack {
            /*
             Add some content while checking
             It could be the Fake splash screen.
             Or some view with a progress and explanation what's going on
             */
            ProgressView("Loading")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }.onAppear(perform: {
            /*
             Here we can do some kind of checking user status. Depends on result
             we can go further with our needs
             */
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                main.route(to: .unauthenticated)
            }
        })
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
