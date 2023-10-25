import UIKit

final class RestorePasswordController: UIViewController {
    
    private let restorePasswordViewModel: RestorePasswordViewModel
    private let restorePasswordView = RestorePasswordView()

    init(restorePasswordViewModel: RestorePasswordViewModel) {
        self.restorePasswordViewModel = restorePasswordViewModel

        super.init(nibName: nil, bundle: nil)

        title = "Напомнить пароль"
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.restorePasswordBacgroundColor

        initRestorePasswordView()
    }

    private func initRestorePasswordView() {
        view.addSubview(restorePasswordView)
        restorePasswordView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        restorePasswordView.setupUI()
    }
}
