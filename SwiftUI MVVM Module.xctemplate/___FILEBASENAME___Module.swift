___FILEHEADER___

import Foundation
import SwiftUI

struct ___VARIABLE_productName:identifier___ModuleInput {}

enum ___VARIABLE_productName:identifier___Module {
    static func build(input: ___VARIABLE_productName:identifier___ModuleInput) -> ___VARIABLE_productName:identifier___View<___VARIABLE_productName:identifier___ViewModelImpl> {
        let dp = ___VARIABLE_productName:identifier___ViewModelImpl.Dependencies()
        let vm = ___VARIABLE_productName:identifier___ViewModelImpl(dp: dp, input: input)
        return ___VARIABLE_productName:identifier___View<___VARIABLE_productName:identifier___ViewModelImpl>(vm: vm)
    }
}
