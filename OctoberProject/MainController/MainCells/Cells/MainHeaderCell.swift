//
//  MainHeaderCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 01.11.2023.
//

import UIKit
import SnapKit

protocol MainHeaderCellDelegate: AnyObject {
    func settingsDidTap()
}
class MainHeaderCell: UITableViewCell {

    weak var delegate: MainHeaderCellDelegate?
    
    private enum UIConstants {
        static let personPhotoSize: CGFloat = 118
        static let petPhotoSize: CGFloat = 80
        static let personAndPetNameLabelFontSize: CGFloat = 20
        static let timeForAWalkLabelFontSize: CGFloat = 14
        static let dialogImageSize: CGFloat = 47
        static let settingsImageWeight: CGFloat = 177
        static let settingsImageHeight: CGFloat = 46
        static let onlineIndicatorSize: CGFloat = 10
        static let onlineIndicatorColor = UIColor(red: 13/255, green: 201/255, blue: 112/255, alpha: 1)
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let settingsButtonBorderColor = CGColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 1)
        static let messageCountNotificationLabelBackroundColor = UIColor(red: 250/255, green: 46/255, blue: 105/255, alpha: 1)
        static let textGreyColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
        static let messageCountNotificationLabelFont: CGFloat = 7
    }
    private let topImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "top")
        return view
    }()
    private let personPhoto: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.personPhotoSize / 2
        view.clipsToBounds = true
        return view
    }()
    private let petPhoto: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petPhotoSize / 2
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    private let personAndPetNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.personAndPetNameLabelFontSize, weight: .bold)
        return label
    }()
    private let onlineIndicatorImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.onlineIndicatorSize / 2
        view.clipsToBounds = true
        view.backgroundColor = UIConstants.onlineIndicatorColor
        return view
    }()
    private let timeForAWalkLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.timeForAWalkLabelFontSize)
        label.textColor = UIConstants.textGreyColor
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
        button.setImage(UIImage(named: "ChatWithoutNotifications"), for: .normal)
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
    // MARK: - Init
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            initialize()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    // MARK: - configure
        func configure(with info: MainHeaderCellStruct) {
            personPhoto.image = info.personPhoto
            petPhoto.image = info.petPhoto
            personAndPetNameLabel.text = info.names
            timeForAWalkLabel.text = info.timeForAWalkLabel
            settingsButton.addTarget(self, action: #selector(settingsDidTap), for: .touchUpInside)
        }
        @objc private func settingsDidTap() {
            delegate?.settingsDidTap()
        }
    
}


private extension MainHeaderCell {
    func initialize() {
        selectionStyle = .none
        backgroundColor = UIConstants.backColor
        contentView.addSubview(topImage)
        topImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        contentView.addSubview(personPhoto)
        personPhoto.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.personPhotoSize)
            make.leading.equalTo(topImage).inset(20)
            make.top.equalTo(topImage).inset(70)
        }
        contentView.addSubview(petPhoto)
        petPhoto.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.petPhotoSize)
            make.leading.equalTo(personPhoto.snp.trailing).offset(-40)
            make.bottom.equalTo(personPhoto)
        }
        contentView.addSubview(dialogImage)
        dialogImage.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.dialogImageSize)
            make.top.equalTo(personPhoto)
            make.trailing.equalToSuperview().inset(20)
        }
        contentView.addSubview(dialogButton)
        dialogButton.snp.makeConstraints { make in
            make.center.equalTo(dialogImage)
        }
        contentView.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { make in
            make.width.equalTo(UIConstants.settingsImageWeight)
            make.height.equalTo(UIConstants.settingsImageHeight)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(petPhoto)
        }
        contentView.addSubview(personAndPetNameLabel)
        personAndPetNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(personPhoto)
            make.top.equalTo(personPhoto.snp.bottom).offset(20)
        }
        contentView.addSubview(onlineIndicatorImage)
        onlineIndicatorImage.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.onlineIndicatorSize)
            make.top.equalTo(personAndPetNameLabel)
            make.leading.equalTo(personAndPetNameLabel.snp.trailing)
        }
        contentView.addSubview(timeForAWalkLabel)
        timeForAWalkLabel.snp.makeConstraints { make in
            make.leading.equalTo(personAndPetNameLabel)
            make.top.equalTo(personAndPetNameLabel.snp.bottom).offset(6)
            make.bottom.equalToSuperview()
        }
    }
}
