//
//  SettingsPersonCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 19.11.2023.
//

import UIKit
import SnapKit

class SettingsPersonCell: UITableViewCell {
    
    private enum UIConstants {
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let personPhotoCornerRadius: CGFloat = 26
        static let personPhotoBorderColor = CGColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 0.2)
        static let personPhotoImageSize: CGFloat = 140
        static let phoneTitleLabelFontSize: CGFloat = 22
        static let textGreyColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
        static let genderHeight: CGFloat = 46
        static let fieldImageViewHeight: CGFloat = 60
    }
    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let personPhotoImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.personPhotoCornerRadius
        view.clipsToBounds = true
        return view
    }()
    private let phoneTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        //label.font = .systemFont(ofSize: UIConstants.phoneTitleLabelFontSize)
        label.textColor = UIConstants.textGreyColor
        label.text = "Телефон"
        return label
    }()
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "Телефон"
        return label
    }()
    private let loadPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Загрузить фото", for: .normal)
        //        button.tintColor = .black
        button.backgroundColor = UIConstants.backColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    private let manGenderButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 10
        config.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: -20, bottom: 2, trailing: 10)
        let button = UIButton(configuration: config, primaryAction: nil)
        button.layer.cornerRadius = UIConstants.genderHeight / 2
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.setTitle("Мужчина", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setImage(UIImage(named: "ActiveMale"), for: .normal)
        return button
    }()
    private let womanGenderButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 10
        config.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: -20, bottom: 2, trailing: 10)
        let button = UIButton(configuration: config, primaryAction: nil)
        button.layer.cornerRadius = UIConstants.genderHeight / 2
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.setTitle("Женщина", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setImage(UIImage(named: "ActiveFemale"), for: .normal)
        button.tintColor = .systemPink
        return button
    }()
    private let nameFieldImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Имя"
        return label
    }()
    private var nameTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Имя"
        return text
    }()
    private let locationFieldImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Местоположение"
        return label
    }()
    private let locationTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Местоположение"
        return text
    }()
    private let locationMarkerMap: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 17
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.image = UIImage(named: "markerMap")
        return view
    }()
    private let emailFieldImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "E-mail"
        return label
    }()
    private let emailTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "E-mail"
        return text
    }()
    private let changePassImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let changePassTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIConstants.textGreyColor
        label.text = "Изменение пароля"
        return label
    }()
    private let currentPassImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let currentPassTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Текущий пароль"
        return label
    }()
    private let currentPassTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Текущий пароль"
        text.isSecureTextEntry = true
        return text
    }()
    private let currentPassEyeIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "CloseEye"), for: .normal)
        return button
    }()
    private let newPassImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let newPassTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Новый пароль"
        return label
    }()
    private let newPassTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Новый пароль"
        text.isSecureTextEntry = true
        return text
    }()
    private let newPassEyeIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "CloseEye"), for: .normal)
        return button
    }()
    private let repitNewPassImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let repitNewPassTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Повторить новый пароль"
        return label
    }()
    private let repitNewPassTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Повторить новый пароль"
        text.isSecureTextEntry = true
        return text
    }()
    private let repitPassEyeIconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "CloseEye"), for: .normal)
        return button
    }()
    private let cancellButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = UIConstants.genderHeight / 2
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.setTitle("Отменить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    private let safeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = UIConstants.genderHeight / 2
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    private let supportLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Если у вас возникли проблемы или вы хотите задать вопрос напишите нам на почту info@petapp.com"
        return label
    }()
    private let deleteAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Удалить аккаунт", for: .normal)
        button.tintColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIConstants.backColor
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with info: SettingsPersonCellStruct) {
        personPhotoImageView.image = info.personPhoto
        phoneLabel.text = info.personPhone
        manGenderButton.addTarget(self, action: #selector(manGenderButtonPressed), for: .touchUpInside)
        womanGenderButton.addTarget(self, action: #selector(womanGenderButtonPressed), for: .touchUpInside)
        nameTextField.text = info.personName
        locationTextField.text = info.personLocation
        emailTextField.text = info.personMail
        manGenderButtonPressed()
        currentPassEyeIconButton.addTarget(self, action: #selector(currentPassEyeIconViewPressed), for: .touchUpInside)
        newPassEyeIconButton.addTarget(self, action: #selector(newPassEyeIconButtonPressed), for: .touchUpInside)
        repitPassEyeIconButton.addTarget(self, action: #selector(repitPassEyeIconButtonPressed), for: .touchUpInside)
                
    }
    @objc func manGenderButtonPressed() {
        manGenderButton.backgroundColor = UIColor.systemBlue
        manGenderButton.tintColor = .white
        manGenderButton.setImage(UIImage(named: "ActiveMale"), for: .normal)
        womanGenderButton.backgroundColor = UIColor.clear
        womanGenderButton.tintColor = .systemPink
        womanGenderButton.setImage(UIImage(named: "NoActiveFemale"), for: .normal)
    }
    @objc func womanGenderButtonPressed() {
        womanGenderButton.backgroundColor = UIColor.systemPink
        womanGenderButton.tintColor = .white
        womanGenderButton.setImage(UIImage(named: "ActiveFemale"), for: .normal)
        manGenderButton.backgroundColor = UIColor.clear
        manGenderButton.tintColor = .systemBlue
        manGenderButton.setImage(UIImage(named: "NoActiveMale"), for: .normal)
    }
    @objc func currentPassEyeIconViewPressed() {
            if currentPassTextField.isSecureTextEntry == true {
                currentPassTextField.isSecureTextEntry = false
                currentPassEyeIconButton.setImage(UIImage(named: "Eye"), for: .normal)

            } else {
                currentPassTextField.isSecureTextEntry = true
                currentPassEyeIconButton.setImage(UIImage(named: "CloseEye"), for: .normal)

            }
            print(#function)
        }
    @objc func newPassEyeIconButtonPressed() {
           if newPassTextField.isSecureTextEntry == true {
               newPassTextField.isSecureTextEntry = false
               newPassEyeIconButton.setImage(UIImage(named: "Eye"), for: .normal)
           } else {
               newPassTextField.isSecureTextEntry = true
               newPassEyeIconButton.setImage(UIImage(named: "CloseEye"), for: .normal)
           }
           print(#function)
       }
       @objc func repitPassEyeIconButtonPressed() {
           if repitNewPassTextField.isSecureTextEntry == true {
               repitNewPassTextField.isSecureTextEntry = false
               repitPassEyeIconButton.setImage(UIImage(named: "Eye"), for: .normal)
           } else {
               repitNewPassTextField.isSecureTextEntry = true
               repitPassEyeIconButton.setImage(UIImage(named: "CloseEye"), for: .normal)
           }
           print(#function)
       }
    
    
    
    
    
    
    
    
}
extension SettingsPersonCell {
    func configureUI(){
        selectionStyle = .none
        backgroundColor = UIConstants.backColor
        contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(533)
        }
        contentView.addSubview(personPhotoImageView)
        personPhotoImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.size.equalTo(UIConstants.personPhotoImageSize)
        }
        contentView.addSubview(phoneTitleLabel)
        phoneTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalTo(personPhotoImageView.snp.trailing).offset(20)
        }
        contentView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.leading.equalTo(personPhotoImageView.snp.trailing).offset(20)
        }
        contentView.addSubview(loadPhotoButton)
        loadPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(personPhotoImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(40)
        }
        contentView.addSubview(manGenderButton)
        manGenderButton.snp.makeConstraints { make in
            make.top.equalTo(loadPhotoButton.snp.bottom).offset(30)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
            make.height.equalTo(UIConstants.genderHeight)
        }
        contentView.addSubview(womanGenderButton)
        womanGenderButton.snp.makeConstraints { make in
            make.top.equalTo(loadPhotoButton.snp.bottom).offset(30)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
            make.height.equalTo(UIConstants.genderHeight)
        }
        contentView.addSubview(nameFieldImageView)
        nameFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(womanGenderButton.snp.bottom).offset(30)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        contentView.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.bottom.equalTo(nameFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(locationFieldImageView)
        locationFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(nameFieldImageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        contentView.addSubview(locationTitleLabel)
        locationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(locationFieldImageView).inset(11)
            make.left.equalToSuperview().inset(35)
        }
        contentView.addSubview(locationTextField)
        locationTextField.snp.makeConstraints { make in
            make.bottom.equalTo(locationFieldImageView).inset(11)
            make.left.equalToSuperview().inset(35)
            make.right.equalToSuperview().inset(80)
        }
        contentView.addSubview(locationMarkerMap)
        locationMarkerMap.snp.makeConstraints { make in
            make.centerY.equalTo(locationFieldImageView)
            make.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(emailFieldImageView)
        emailFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(locationFieldImageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        contentView.addSubview(emailTitleLabel)
        emailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(emailFieldImageView).inset(11)
            make.left.equalToSuperview().inset(35)
        }
        contentView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.bottom.equalTo(emailFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(changePassImageView)
        changePassImageView.snp.makeConstraints { make in
            make.top.equalTo(emailFieldImageView.snp.bottom).offset(40)
            make.right.left.equalToSuperview()
            make.height.equalTo(296)
        }
        contentView.addSubview(changePassTitleLabel)
        changePassTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(changePassImageView).inset(20)
            make.left.equalToSuperview().inset(20)
        }
        changePassImageView.addSubview(currentPassImageView)
        currentPassImageView.snp.makeConstraints { make in
            make.top.equalTo(changePassTitleLabel.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        currentPassImageView.addSubview(currentPassTitleLabel)
        currentPassTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        contentView.addSubview(currentPassTextField)
        currentPassTextField.snp.makeConstraints { make in
            make.bottom.equalTo(currentPassImageView).inset(11)
            make.left.equalToSuperview().inset(35)
            make.right.equalToSuperview().inset(80)
        }
        contentView.addSubview(currentPassEyeIconButton)
        currentPassEyeIconButton.snp.makeConstraints { make in
            make.centerY.equalTo(currentPassImageView)
            make.right.equalToSuperview().inset(35)
        }
        changePassImageView.addSubview(newPassImageView)
        newPassImageView.snp.makeConstraints { make in
            make.top.equalTo(currentPassImageView.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        newPassImageView.addSubview(newPassTitleLabel)
        newPassTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        contentView.addSubview(newPassTextField)
        newPassTextField.snp.makeConstraints { make in
            make.bottom.equalTo(newPassImageView).inset(11)
            make.left.equalToSuperview().inset(35)
            make.right.equalToSuperview().inset(80)
        }
        contentView.addSubview(newPassEyeIconButton)
        newPassEyeIconButton.snp.makeConstraints { make in
            make.centerY.equalTo(newPassImageView)
            make.right.equalToSuperview().inset(35)
        }
        changePassImageView.addSubview(repitNewPassImageView)
        repitNewPassImageView.snp.makeConstraints { make in
            make.top.equalTo(newPassImageView.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        repitNewPassImageView.addSubview(repitNewPassTitleLabel)
        repitNewPassTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        contentView.addSubview(repitNewPassTextField)
        repitNewPassTextField.snp.makeConstraints { make in
            make.bottom.equalTo(repitNewPassImageView).inset(11)
            make.left.equalToSuperview().inset(35)
            make.right.equalToSuperview().inset(80)
        }
        contentView.addSubview(repitPassEyeIconButton)
        repitPassEyeIconButton.snp.makeConstraints { make in
            make.centerY.equalTo(repitNewPassImageView)
            make.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(cancellButton)
        cancellButton.snp.makeConstraints { make in
            make.top.equalTo(changePassImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
        }
        contentView.addSubview(safeButton)
        safeButton.snp.makeConstraints { make in
            make.top.equalTo(changePassImageView.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
        }
        contentView.addSubview(supportLabel)
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(safeButton.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(38)
        }
        contentView.addSubview(deleteAccountButton)
        deleteAccountButton.snp.makeConstraints { make in
            make.top.equalTo(supportLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
