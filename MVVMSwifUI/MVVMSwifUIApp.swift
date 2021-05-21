//
//  MVVMSwifUIApp.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 17.05.2021.
//

import SwiftUI

@main
struct MVVMSwifUIApp: App {
    
    init() {
        DependencyProvider.shared.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
