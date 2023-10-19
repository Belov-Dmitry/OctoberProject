import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private var loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLoginView()
    }
    
    private func initLoginView() {
       
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        loginView.setupUI()
    }
}
