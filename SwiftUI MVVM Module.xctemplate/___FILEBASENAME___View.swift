___FILEHEADER___

import SwiftUI

struct ___VARIABLE_productName:identifier___View<ViewModel>: View where ViewModel: ___VARIABLE_productName:identifier___ViewModel {
    //ViewModel
    @StateObject var vm: ViewModel
   
    var body: some View {
        Text("Hello world!")
    }
}

struct ___VARIABLE_productName:identifier___View_Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_productName:identifier___Module.build(input: .init())
    }
}

extension ___VARIABLE_productName:identifier___View {
    /*
     For methods that are related to View
     */
}
