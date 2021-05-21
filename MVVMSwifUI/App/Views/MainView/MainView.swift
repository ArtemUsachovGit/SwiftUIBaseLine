//
//  MainView.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 17.05.2021.
//

import SwiftUI
import Stinsen

struct MainView: View {
    
    var body: some View {
        CoordinatorView(
            MainCoordinator()
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
