import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private var loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        
        super.init(nibName: nil, bundle: nil)

        loginView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoginView()

        loginView.enableOrDisableLoginButton(false)
    }
    
    var coordinator: Coordinator?

    private func initLoginView() {
       
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        loginView.setupUI()
    }
}

extension LoginViewController: LoginViewDelegate {
    func performAuth() {
        loginViewModel.signIn()

        coordinator?.start()
    }
    
    func setLogin(login: String) {
        self.loginViewModel.login = login
        loginView.enableOrDisableLoginButton(loginViewModel.isValid)
    }
    
    func setPassword(password: String) {
        self.loginViewModel.password = password
        loginView.enableOrDisableLoginButton(loginViewModel.isValid)
    }
}
