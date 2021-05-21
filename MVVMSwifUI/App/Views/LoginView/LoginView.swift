//
//  LoginView.swift
//  MVVMSwifUI
//
//  Created by Artem Usachov on 17.05.2021.
//

import SwiftUI
import Stinsen

struct LoginView<ViewModel>: View where ViewModel: LoginViewModel {
    //ViewModel
    @StateObject var vm: ViewModel
    //Coordinators
    @EnvironmentObject var main: ViewRouter<MainCoordinator.Route>
    @EnvironmentObject var unauthenticated: NavigationRouter<UnauthenticatedCoordinator.Route>
    //States of the view
    @State var showAlert = false
    @State var requestError: Error?
    
    var body: some View {
        VStack(spacing: 10) {
            if vm.isLoading {//for loadign process
                ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            } else {//for login process
                TextField("Name", text: $vm.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $vm.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())                    
                Button(action: {
                    vm.action.login(completion: handleLoginRequest)
                }, label: {
                    Text("Login")
                }).disabled(vm.submitButtonDisabled)
                Button(action: showForgotPassword) {
                    Text("Forgot Password")
                }
            }
        }
        .alert(isPresented: $showAlert, content: alert)
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginModule.build(input: .init())
    }
}

extension LoginView {
    
    func showForgotPassword() {
        unauthenticated.route(to: .forgotPassword)
    }
    
    func handleLoginRequest(_ result: Result<User, Error>) {
        switch result {
        case .success(let user):
            main.route(to: .authenticated(user))
        case .failure(let error):
            self.requestError = error
            self.showAlert = true
        }
    }
    
    func alert() -> Alert {
        guard let error = requestError else {
            fatalError("No error provided")
        }
        return Alert(title: Text("Error"),
              message: Text("\(error.localizedDescription)"),
              dismissButton: .default(Text("OK")))
    }
}
