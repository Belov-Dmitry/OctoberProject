//
//  MainPersonInfoCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 01.11.2023.
//
import UIKit
import SnapKit

protocol MainPersonInfoCellDelegate: AnyObject {
    func personInfoViewLabelTap()
}
class MainPersonInfoCell: UITableViewCell {
    weak var delegate: MainPersonInfoCellDelegate?
    private enum UIConstants {
        static let personInfoTitleLabelFontSize: CGFloat = 13
        static let personInfoLabelFontSize: CGFloat = 16
        static let personInfoEditButtonImageSize: CGFloat = 11
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let textGreyColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
        static let textBlueColor = UIColor(red: 49/255, green: 101/255, blue: 200/255, alpha: 1)
    }
    private let personInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.personInfoTitleLabelFontSize)
        return label
    }()
    private let personInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.personInfoLabelFontSize)
        return label
    }()
    private let personInfoEditButtonImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "editButton")
        return view
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
        func configure(with info: MainPersonInfoCellStruct) {
            personInfoLabel.text = info.personData
            setupPersonInfoViewLabelTap()
        }
    // MARK: - Tap methods
        func setupPersonInfoViewLabelTap() {
            if personInfoLabel.text == "Нажмите, чтобы редактировать" {
                personInfoLabel.font = UIFont(name: "SF UI Text", size: 16)
                personInfoLabel.textColor = UIConstants.textBlueColor
                personInfoTitleLabel.text = "О себе"
                let personInfoViewLabelTap = UITapGestureRecognizer(target: self, action: #selector(self.personInfoViewLabelTap(_:)))
                self.personInfoLabel.isUserInteractionEnabled = true
                self.personInfoLabel.addGestureRecognizer(personInfoViewLabelTap)
            }
            else {
                personInfoLabel.font = UIFont(name: "SF UI Text", size: 8)
                personInfoLabel.textColor = UIConstants.textGreyColor
                personInfoLabel.numberOfLines = 5
                personInfoTitleLabel.text = "Основная информация"
                contentView.addSubview(personInfoEditButtonImage)
                personInfoEditButtonImage.snp.makeConstraints{ make in
                    make.trailing.equalToSuperview().inset(20)
                    make.top.equalToSuperview().offset(20)
                    make.size.equalTo(UIConstants.personInfoEditButtonImageSize)
                }
                let personInfoEditButtonImageTap = UITapGestureRecognizer(target: self, action: #selector(self.personInfoViewLabelTap(_:)))
                self.personInfoEditButtonImage.isUserInteractionEnabled = true
                self.personInfoEditButtonImage.addGestureRecognizer(personInfoEditButtonImageTap)
                print("1")
            }
        }
        @objc func personInfoViewLabelTap(_ sender: UITapGestureRecognizer) {
            print("label pressed personInfo")
            delegate?.personInfoViewLabelTap()
            
        }
    }
    // MARK: - Private methods
    private extension MainPersonInfoCell {
        func initialize() {
            selectionStyle = .none
            backgroundColor = UIConstants.backColor
            contentView.layer.cornerRadius = 15
            contentView.clipsToBounds = true
            contentView.backgroundColor = .white
            contentView.addSubview(personInfoTitleLabel)
            personInfoTitleLabel.snp.makeConstraints{ make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.top.equalToSuperview().offset(20)
            }
            contentView.addSubview(personInfoLabel)
            personInfoLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.top.equalTo(personInfoTitleLabel.snp.bottom).offset(10)
                make.bottom.equalToSuperview().inset(20)
            }
            
        }
    }


