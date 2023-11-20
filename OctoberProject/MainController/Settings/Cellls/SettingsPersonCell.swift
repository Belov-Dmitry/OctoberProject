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
        return button
    }()
    private let manGenderButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = UIConstants.genderHeight / 2
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.setTitle("   Мужчина", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setImage(UIImage(named: "NoActiveMale"), for: .normal)
        return button
    }()
    private let womanGenderButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = UIConstants.genderHeight / 2
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.setTitle("   Женщина", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setImage(UIImage(named: "NoActiveFemale"), for: .normal)
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
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
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
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
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
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
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
    private let currentPassLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "Текущий пароль"
        return label
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
    private let newPassLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "Новый пароль"
        return label
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
    private let repitNewPassLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.text = "Повторить новый пароль"
        return label
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
        nameLabel.text = info.personName
        locationLabel.text = info.personLocation
        emailLabel.text = info.personMail
        
    }
    @objc func manGenderButtonPressed() {
        manGenderButton.backgroundColor = UIColor.systemBlue
        manGenderButton.tintColor = .white
        womanGenderButton.backgroundColor = UIColor.clear
        womanGenderButton.tintColor = .systemPink
    }
    @objc func womanGenderButtonPressed() {
        womanGenderButton.backgroundColor = UIColor.systemPink
        womanGenderButton.tintColor = .white
        manGenderButton.backgroundColor = UIColor.clear
        manGenderButton.tintColor = .systemBlue
    }
}
extension SettingsPersonCell {
    func configureUI(){
        selectionStyle = .none
        backgroundColor = UIConstants.backColor
        contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            //make.bottom.equalTo(emailFieldImageView.snp.bottom).inset(20)
        }
        backgroundImageView.addSubview(personPhotoImageView)
        personPhotoImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.size.equalTo(UIConstants.personPhotoImageSize)
        }
        backgroundImageView.addSubview(phoneTitleLabel)
        phoneTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalTo(personPhotoImageView.snp.trailing).offset(20)
        }
        backgroundImageView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.leading.equalTo(personPhotoImageView.snp.trailing).offset(20)
        }
        backgroundImageView.addSubview(loadPhotoButton)
        loadPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(personPhotoImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(40)
        }
        backgroundImageView.addSubview(manGenderButton)
        manGenderButton.snp.makeConstraints { make in
            make.top.equalTo(loadPhotoButton.snp.bottom).offset(30)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
            make.height.equalTo(UIConstants.genderHeight)
        }
        backgroundImageView.addSubview(womanGenderButton)
        womanGenderButton.snp.makeConstraints { make in
            make.top.equalTo(loadPhotoButton.snp.bottom).offset(30)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
            make.height.equalTo(UIConstants.genderHeight)
        }
        backgroundImageView.addSubview(nameFieldImageView)
        nameFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(womanGenderButton.snp.bottom).offset(30)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        nameFieldImageView.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        nameFieldImageView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        backgroundImageView.addSubview(locationFieldImageView)
        locationFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(nameFieldImageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        locationFieldImageView.addSubview(locationTitleLabel)
        locationTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        locationFieldImageView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        backgroundImageView.addSubview(emailFieldImageView)
        emailFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(locationFieldImageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
            make.bottom.equalToSuperview().inset(20)
        }
        emailFieldImageView.addSubview(emailTitleLabel)
        emailTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        emailFieldImageView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
        }
        contentView.addSubview(changePassImageView)
        changePassImageView.snp.makeConstraints { make in
            make.top.equalTo(emailFieldImageView.snp.bottom).offset(40)
            make.right.left.equalToSuperview()
            make.height.equalTo(286)
        }
        changePassImageView.addSubview(changePassTitleLabel)
        changePassTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
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
        currentPassImageView.addSubview(currentPassLabel)
        currentPassLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
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
        newPassImageView.addSubview(newPassLabel)
        newPassLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
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
        repitNewPassImageView.addSubview(repitNewPassLabel)
        repitNewPassLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.left.equalToSuperview().inset(15)
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
