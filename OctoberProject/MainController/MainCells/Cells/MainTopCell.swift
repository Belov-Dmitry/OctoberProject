//
//  MainTopCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 11.10.2023.
//

import UIKit
import SnapKit

class MainTopCell: UICollectionViewCell {
    private enum UIConstants {
        static let personPhoto: CGFloat = 118
        static let petPhoto: CGFloat = 80
        static let personAndPetNameLabelFontSize: CGFloat = 20
        static let timeForAWalkLabelFontSize: CGFloat = 14
        static let dialogImageSize: CGFloat = 47
        static var personInfoViewHeight = 87
        static let personInfoViewTitleLabelFontSize: CGFloat = 13
        static let messageCountNotificationLabelFont: CGFloat = 7
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let settingsButtonBorderColor = CGColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        static let messageCountNotificationLabelBackroundColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1)
    }
    private let topImage = UIImageView()
    private let personPhoto: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.personPhoto / 2
        view.clipsToBounds = true
        return view
    }()
    let petPhoto: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petPhoto / 2
        view.clipsToBounds = true
        return view
    }()
    private let personAndPetNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.personAndPetNameLabelFontSize, weight: .bold)
        return label
    }()
    private let onlineIndicatorImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private let timeForAWalkLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.timeForAWalkLabelFontSize, weight: .bold)
        label.textColor = .gray
        return label
    }()
    private let dialogImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.dialogImageSize / 2
        view.clipsToBounds = true
        view.backgroundColor = UIConstants.backColor
        return view
    }()
    private let dialogButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemBlue
        return button
    }()
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Settings"), for: .normal)
        button.setTitle(" Настройки", for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIConstants.backColor
        button.layer.cornerRadius = 23
        button.clipsToBounds = true
        button.layer.borderWidth = 3
        button.layer.borderColor = UIConstants.settingsButtonBorderColor
        return button
    }()
    private let personInfoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let personInfoViewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.personInfoViewTitleLabelFontSize)
        return label
    }()
    private let personInfoViewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        return label
    }()
    private let messageCountNotificationLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        label.font = .systemFont(ofSize: UIConstants.messageCountNotificationLabelFont, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIConstants.messageCountNotificationLabelBackroundColor
        return label
    }()
    private let personInfoEditView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "editButton")
        return view
    }()
    var dialogButtonImageName = "ChatWithoutNotifications"
    var aboutPersonData: String = "Нажмите чтобы редактировать"
    var messageCountNotificationLabelText = "10"
    var personName = "Name"
    var petName = "PetName"
    
    
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setupPersonInfoViewLabelTap()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - methods
    func configure() {
        personPhoto.image = UIImage(named: "person")
        petPhoto.image = UIImage(named: "pet")
        personAndPetNameLabel.text = "\(personName) и \(petName)"
        onlineIndicatorImage.image = UIImage(named: "onlineIndicator")
        timeForAWalkLabel.text = "На прогулке ещё 15 минут"
        dialogButton.setImage(UIImage(named: dialogButtonImageName), for: .normal)
        messageCountNotificationLabel.text = messageCountNotificationLabelText
        personInfoViewLabel.text = aboutPersonData
    }
    @objc func personInfoViewLabelTap(_ sender: UITapGestureRecognizer){
        print("label pressed")
    }
    func setupPersonInfoViewLabelTap() {
        if aboutPersonData == "Нажмите чтобы редактировать" {
            personInfoViewLabel.font = UIFont(name: "SF UI Text", size: 16)
            personInfoViewLabel.textColor = UIColor(red: 49/255, green: 101/255, blue: 200/255, alpha: 1)
            personInfoViewTitleLabel.text = "О себе"
            let personInfoViewLabelTap = UITapGestureRecognizer(target: self, action: #selector(self.personInfoViewLabelTap(_:)))
            self.personInfoViewLabel.isUserInteractionEnabled = true
            self.personInfoViewLabel.addGestureRecognizer(personInfoViewLabelTap)
            
            contentView.addSubview(personInfoView)
            personInfoView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(267)
                make.width.equalToSuperview()
                make.height.equalTo(87)
            }
            contentView.addSubview(personInfoViewTitleLabel)
            personInfoViewTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(personInfoView).inset(20)
                make.leading.equalTo(personInfoView).inset(20)
            }
            contentView.addSubview(personInfoViewLabel)
            personInfoViewLabel.snp.makeConstraints { make in
                make.top.equalTo(personInfoView).inset(46)
                make.left.right.equalToSuperview().inset(20)
            }
        }
        else {
            personInfoViewLabel.font = UIFont(name: "SF UI Text", size: 8)
            personInfoViewLabel.textColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
            personInfoViewTitleLabel.text = "Основная информация"
            
            contentView.addSubview(personInfoView)
            personInfoView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(267)
                make.width.equalToSuperview()
                make.height.equalTo(171)
            }
            contentView.addSubview(personInfoViewTitleLabel)
            personInfoViewTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(personInfoView).inset(20)
                make.leading.equalTo(personInfoView).inset(20)
            }
            contentView.addSubview(personInfoViewLabel)
            personInfoViewLabel.snp.makeConstraints { make in
                make.top.equalTo(personInfoView).inset(46)
                make.left.right.equalToSuperview().inset(20)
            }
            contentView.addSubview(personInfoEditView)
            personInfoEditView.snp.makeConstraints { make in
                make.width.height.equalTo(11)
                make.top.equalTo(personInfoView).inset(15)
                make.right.equalTo(personInfoView).inset(18)
            }
        }
    }
}
// MARK: - Private methods
private extension MainTopCell {
    func initialize (){       
        contentView.addSubview(topImage)
        topImage.image = UIImage(named: "top")
        topImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        contentView.addSubview(personPhoto)
        personPhoto.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(62)
            make.leading.equalTo(20)
            make.width.equalTo(118)
            make.height.equalTo(118)
        }
        contentView.addSubview(petPhoto)
        petPhoto.layer.borderWidth = 3
        petPhoto.layer.borderColor = UIColor.white.cgColor
        petPhoto.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.equalTo(118)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        contentView.addSubview(personAndPetNameLabel)
        personAndPetNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(personPhoto)
            //make.trailing.equalToSuperview()
            make.top.equalTo(personPhoto.snp.bottom).offset(20)
        }
        contentView.addSubview(onlineIndicatorImage)
        onlineIndicatorImage.snp.makeConstraints { make in
            make.leading.equalTo(personAndPetNameLabel.snp.trailing)
            make.top.equalTo(personAndPetNameLabel)
            make.size.equalTo(10)
        }
        contentView.addSubview(timeForAWalkLabel)
        timeForAWalkLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(229)
        }
        contentView.addSubview(dialogImage)
        dialogImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(62)
            make.size.equalTo(47)
        }
        contentView.addSubview(dialogButton)
        dialogButton.snp.makeConstraints { make in
            make.center.equalTo(dialogImage)
            make.size.equalTo(22)
        }
        contentView.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.leading.equalTo(petPhoto).inset(100)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(134)
            make.height.equalTo(46)
        }
        contentView.addSubview(messageCountNotificationLabel)
        messageCountNotificationLabel.snp.makeConstraints { make in
            make.trailing.equalTo(dialogImage).inset(0)
            make.top.equalTo(dialogImage).inset(0)
            make.width.equalTo(17)
            make.height.equalTo(12)
        }
    }
}
