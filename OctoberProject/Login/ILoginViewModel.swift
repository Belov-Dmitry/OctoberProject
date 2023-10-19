import Foundation

protocol ILoginViewModel {
    var login: String {get set}
    
    var password: String {get set}
    
    var isValid: Bool {get}
    
    var validationStateChangedAction: (() -> Void)? {get set}
    
    func signIn()
    
    func signUp()
    
    func restorePassword()
}
