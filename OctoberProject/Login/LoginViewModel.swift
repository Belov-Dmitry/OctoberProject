import Foundation

final class LoginViewModel: ILoginViewModel {

    init() {
        
    }
    
    var validationStateChangedAction: (() -> Void)?
    
    var login: String = ""
    
    var password: String = ""
    
    var isValid: Bool {
        return login != "" && password != ""
    }
    
    func signIn() {
        if !isValid {
            return
        }
    }
    
    func signUp() {
        
    }
    
    func restorePassword() {
        
    }
}
