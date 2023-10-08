
import Foundation
import UIKit
import SnapKit

final class LoginView: UIView {
    
    private let defaultMargin = 15.0;
    private let separatorMargin = 20.0;
    private let defaultFieldHeight = 60;
    
    private lazy var restorePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Восстановить пароль", for: .normal)
        button.titleLabel?.font = Fonts.buttonFont
        button.setTitleColor(Colors.buttonColor2, for: .normal)
        return button
    }()
    
    private lazy var verticalSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.borderColor
        return view
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = Fonts.buttonFont
        button.setTitleColor(Colors.buttonColor2, for: .normal)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordTextFileld: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        
        textField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        textField.font = .systemFont(ofSize: 16.0)
        textField.tintColor = Colors.borderColor
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: defaultMargin, height: 50))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(loginOrPasswordTextChanged), for: .editingChanged)
        textField.layer.borderColor = Colors.borderColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var loginTextFileld: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        
        textField.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        textField.font = .systemFont(ofSize: 16.0)
        textField.tintColor = Colors.borderColor
        textField.autocapitalizationType = .none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: defaultMargin, height: 50))
        textField.leftViewMode = .always
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(loginOrPasswordTextChanged), for: .editingChanged)
        textField.layer.borderColor = Colors.borderColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    public lazy var enterTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = Fonts.titleFont
        return label
    }()
    
    func setupUI() {
        
        addSubview(restorePasswordButton)
        restorePasswordButton.snp.makeConstraints { make in
            make.leading.equalTo(superview!.safeAreaLayoutGuide).offset(defaultMargin)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(superview!.safeAreaLayoutGuide).offset(-defaultMargin)
        }
        
        addSubview(verticalSeparatorView)
        verticalSeparatorView.snp.makeConstraints { make in
            make.centerX.equalTo(superview!.safeAreaLayoutGuide)
            make.bottom.equalTo(superview!.safeAreaLayoutGuide).offset(-separatorMargin)
            make.width.equalTo(1)
            make.height.equalTo(18)
        }
        
        addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.leading.equalTo(superview!.safeAreaLayoutGuide.snp.centerX).offset(defaultMargin)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(superview!.safeAreaLayoutGuide).offset(-defaultMargin)
        }
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(superview!.safeAreaLayoutGuide).offset(defaultMargin)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide).offset(-defaultMargin)
            make.height.equalTo(defaultFieldHeight)
            make.bottom.equalTo(restorePasswordButton.snp.top).offset(-defaultMargin)
        }
        
        addSubview(passwordTextFileld)
        passwordTextFileld.snp.makeConstraints { make in
            make.leading.equalTo(superview!.safeAreaLayoutGuide).offset(defaultMargin)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide).offset(-defaultMargin)
            make.height.equalTo(defaultFieldHeight)
            make.bottom.equalTo(loginButton.snp.top).offset(-30)
        }
        
        addSubview(loginTextFileld)
        loginTextFileld.snp.makeConstraints { make in
            make.leading.equalTo(superview!.safeAreaLayoutGuide).offset(defaultMargin)
            make.trailing.equalTo(superview!.safeAreaLayoutGuide).offset(-defaultMargin)
            make.height.equalTo(defaultFieldHeight)
            make.bottom.equalTo(passwordTextFileld.snp.top).offset(-defaultMargin)
        }
        
        addSubview(enterTextLabel)
        enterTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(superview!.safeAreaLayoutGuide)
            make.bottom.equalTo(loginTextFileld.snp.top).offset(-30)
        }
    }
    
    @objc private func loginButtonPressed() {
        print("login pressed")
    }
    
    @objc private func loginOrPasswordTextChanged(){

    }
}
