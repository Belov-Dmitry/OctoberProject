import Foundation

final class LoginViewModel: ILoginViewModel {
    
    
    init() {
        
    }
    
    var validationStateChangedAction: (() -> Void)?
    
    var login: String = "" {
        didSet {
            print(login)
            validationStateChangedAction?()
        }
    }
    
    var password: String = "" {
        didSet {
            print(password)
           validationStateChangedAction?()
        }
    }
    
    var isValid: Bool {
        get {
            return login != "" && password != ""
        }
    }
    
    func signIn() {
        
    }
    
    func signUp() {
        
    }
    
    func restorePassword() {
        
    }
}
