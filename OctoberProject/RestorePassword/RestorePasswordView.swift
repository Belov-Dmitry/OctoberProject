import UIKit
import SnapKit

final class RestorePasswordView : UIView {

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        var attributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        textField.attributedPlaceholder = NSAttributedString(string: "E-mail",
                                                             attributes: attributes)
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 16.0)
        textField.tintColor = Colors.borderColor
        textField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        textField.layer.borderColor = Colors.borderColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()

    private lazy var emailTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Пожалуйста, укажите e-mail, который вы использовали для входа в PetApp для того чтобы мы напомнили ваш пароль"
        label.font = Fonts.labelFont
        label.textAlignment = .center
        label.textColor = Colors.buttonColor2
        return label
    }()

    private lazy var sendRestoreCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить код", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightText, for: .disabled)
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(sendRestoreCodeButtonPressed), for: .touchUpInside)
        return button
    }()

    func setupUI() {

        backgroundColor = Colors.restorePasswordBacgroundColor

        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(emailTextLabel)
        vStack.addArrangedSubview(sendRestoreCodeButton)

        addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.leading.equalTo(superview!.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide).offset(-20)
            make.centerY.equalTo(superview!.safeAreaLayoutGuide)
        }
        vStack.setCustomSpacing(10, after: emailTextField)
        vStack.setCustomSpacing(20, after: emailTextLabel)

        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
        }

        sendRestoreCodeButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }

    @objc
    private func emailChanged() {
        
    }
    
    @objc
    private func sendRestoreCodeButtonPressed() {
        print("Send restore button pressed")
    }
}
