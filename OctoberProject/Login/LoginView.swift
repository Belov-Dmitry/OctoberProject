
import Foundation
import UIKit
import SnapKit

protocol ILoginView {
    
}

final class LoginView: UIView {
    
    private let defaultMargin = 15.0;
    private let separatorMargin = 20.0;
    private let defaultFieldHeight = 60;
    
    private lazy var titleView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TitleImg")
        imageView.backgroundColor = Colors.loginBackgroundColor
        return imageView
    }()
    
    private lazy var roundedBottomImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "roundedBottomImg")
        imageView.backgroundColor = Colors.loginBackgroundColor
        return imageView
    }()
    
    private lazy var manWithDogImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ManWithDog")
        return imageView
    }()
    
    public lazy var enterTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = Fonts.titleFont
        return label
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
        textField.addTarget(self, action: #selector(loginChanged), for: .editingChanged)
        textField.layer.borderColor = Colors.borderColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
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
        textField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        textField.layer.borderColor = Colors.borderColor.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightText, for: .disabled)
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var restorePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Восстановить пароль", for: .normal)
        button.titleLabel?.font = Fonts.buttonFont
        button.setTitleColor(Colors.buttonColor2, for: .normal)
        button.addTarget(self, action: #selector(restorePasswordButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = Fonts.buttonFont
        button.setTitleColor(Colors.buttonColor2, for: .normal)
        button.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var verticalSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.borderColor
        return view
    }()
    
    func setupUI() {
        
        backgroundColor = Colors.loginBackgroundColor
        
        addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(superview!)
        }
        
        addSubview(roundedBottomImage)
        roundedBottomImage.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(superview!)
        }
        
        addSubview(manWithDogImage)
        manWithDogImage.snp.makeConstraints { make in
            make.centerX.equalTo(superview!.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(roundedBottomImage.snp.top).offset(-7)
        }
        
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
        print("login button pressed")
    }
    
    @objc private func restorePasswordButtonPressed() {
        print("restore button pressed")
    }
    
    @objc private func registrationButtonPressed() {
        print("registration button pressed")
    }
    
    @objc private func loginChanged(){
        //loginViewModel.login = loginTextFileld.text!
    }
    
    @objc private func passwordChanged(){
        //loginViewModel.password = passwordTextFileld.text!
    }
}
