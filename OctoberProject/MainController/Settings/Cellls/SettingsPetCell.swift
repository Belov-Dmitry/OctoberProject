//
//  SettingsPetCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 19.11.2023.
//

import UIKit

class SettingsPetCell: UITableViewCell {

    private enum UIConstants {
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let personPhotoCornerRadius: CGFloat = 26
        static let personPhotoBorderColor = CGColor(red: 237/255, green: 237/255, blue: 240/255, alpha: 0.2)
        static let personPhotoImageSize: CGFloat = 140
        static let phoneTitleLabelFontSize: CGFloat = 22
        static let textGreyColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
        static let genderHeight: CGFloat = 46
        static let fieldImageViewHeight: CGFloat = 60
        static let petMediaCollectionViewCellSize: CGFloat = 106
    }
    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let petPhotoImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.personPhotoCornerRadius
        view.clipsToBounds = true
        return view
    }()
    
    private let loadPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Загрузить фото", for: .normal)
        //        button.tintColor = .black
        button.backgroundColor = UIConstants.backColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return button
    }()
    private let boyGenderButton: UIButton = {
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
    private let girlGenderButton: UIButton = {
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
    private let breedFieldImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let breedTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Порода питомца"
        return label
    }()
    private var breedTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Порода питомца"
        return text
    }()
    private let petNameFieldImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let petNameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Имя питомца"
        return label
    }()
    private var petNameTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Имя питомца"
        return text
    }()
    private let petBirthdayFieldImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        return view
    }()
    private let petBirthdayTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIConstants.textGreyColor
        label.text = "Дата рождения"
        return label
    }()
    private var petBirthdayTextField: UITextField = {
        var text = UITextField()
        text.font = .systemFont(ofSize: 16)
        text.placeholder = "Дата рождения"
        return text
    }()
    private var petMediaCollectionView: UICollectionView!
    private let petMediaItems: [PetMediaCollectionItems] = [
        PetMediaCollectionItems(type: .petLoadMediaCell),
        PetMediaCollectionItems(type: .petMediaCell),
        PetMediaCollectionItems(type: .petMediaCell),
        PetMediaCollectionItems(type: .petMediaCell),
        PetMediaCollectionItems(type: .petMediaCell)
    ]
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
    private let deletePetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Удалить питомца", for: .normal)
        button.tintColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIConstants.backColor
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        addCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(with info: SettingsPetCellStruct) {
        petPhotoImageView.image = info.petPhoto
        
        boyGenderButton.addTarget(self, action: #selector(boyGenderButtonPressed), for: .touchUpInside)
        girlGenderButton.addTarget(self, action: #selector(girlGenderButtonPressed), for: .touchUpInside)
        breedTextField.text = info.petBreed
        petNameTextField.text = info.petName
        
        boyGenderButtonPressed()
        
                
    }
    @objc func boyGenderButtonPressed() {
        boyGenderButton.backgroundColor = UIColor.systemBlue
        boyGenderButton.tintColor = .white
        boyGenderButton.setImage(UIImage(named: "ActiveMale"), for: .normal)
        girlGenderButton.backgroundColor = UIColor.clear
        girlGenderButton.tintColor = .systemPink
        girlGenderButton.setImage(UIImage(named: "NoActiveFemale"), for: .normal)
    }
    @objc func girlGenderButtonPressed() {
        girlGenderButton.backgroundColor = UIColor.systemPink
        girlGenderButton.tintColor = .white
        girlGenderButton.setImage(UIImage(named: "ActiveFemale"), for: .normal)
        boyGenderButton.backgroundColor = UIColor.clear
        boyGenderButton.tintColor = .systemBlue
        boyGenderButton.setImage(UIImage(named: "NoActiveMale"), for: .normal)
    }
    
    
}
extension SettingsPetCell {
    func configureUI(){
        selectionStyle = .none
        backgroundColor = UIConstants.backColor
        contentView.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(645)
        }
        contentView.addSubview(petPhotoImageView)
        petPhotoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(UIConstants.personPhotoImageSize)
        }
        contentView.addSubview(loadPhotoButton)
        loadPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(petPhotoImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(16)
        }
        contentView.addSubview(boyGenderButton)
        boyGenderButton.snp.makeConstraints { make in
            make.top.equalTo(loadPhotoButton.snp.bottom).offset(30)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
            make.height.equalTo(UIConstants.genderHeight)
        }
        contentView.addSubview(girlGenderButton)
        girlGenderButton.snp.makeConstraints { make in
            make.top.equalTo(loadPhotoButton.snp.bottom).offset(30)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
            make.height.equalTo(UIConstants.genderHeight)
        }
        contentView.addSubview(breedFieldImageView)
        breedFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(girlGenderButton.snp.bottom).offset(30)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        contentView.addSubview(breedTitleLabel)
        breedTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(breedFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(breedTextField)
        breedTextField.snp.makeConstraints { make in
            make.bottom.equalTo(breedFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(petNameFieldImageView)
        petNameFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(breedFieldImageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        contentView.addSubview(petNameTitleLabel)
        petNameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(petNameFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(petNameTextField)
        petNameTextField.snp.makeConstraints { make in
            make.bottom.equalTo(petNameFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(petBirthdayFieldImageView)
        petBirthdayFieldImageView.snp.makeConstraints { make in
            make.top.equalTo(petNameFieldImageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.fieldImageViewHeight)
        }
        contentView.addSubview(petBirthdayTitleLabel)
        petBirthdayTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(petBirthdayFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(petBirthdayTextField)
        petBirthdayTextField.snp.makeConstraints { make in
            make.bottom.equalTo(petBirthdayFieldImageView).inset(11)
            make.left.right.equalToSuperview().inset(35)
        }
        contentView.addSubview(cancellButton)
        cancellButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
        }
        contentView.addSubview(safeButton)
        safeButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.width.equalTo((UIScreen.main.bounds.width - 60) / 2)
        }
        contentView.addSubview(supportLabel)
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(safeButton.snp.bottom).offset(20)
            make.right.left.equalToSuperview().inset(38)
        }
        contentView.addSubview(deletePetButton)
        deletePetButton.snp.makeConstraints { make in
            make.top.equalTo(supportLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    func addCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //горизонтальный скрол
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20) //отступы ячейки коллекции
        petMediaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        petMediaCollectionView.showsHorizontalScrollIndicator = false //индикатор скрола
        petMediaCollectionView.dataSource = self
        petMediaCollectionView.delegate = self
        petMediaCollectionView.register(PetMediaCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PetMediaCollectionViewCell.self))
        petMediaCollectionView.register(PetLoadMediaCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PetLoadMediaCollectionViewCell.self))
        contentView.addSubview(petMediaCollectionView)
        petMediaCollectionView.snp.makeConstraints { make in
            make.top.equalTo(petBirthdayFieldImageView.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.height.equalTo(UIConstants.petMediaCollectionViewCellSize)
            make.width.equalToSuperview()
        }
        }
}
// MARK: - UICollectionViewDataSource
extension SettingsPetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        petMediaItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = petMediaItems[indexPath.row]
        switch item.type {
        case.petMediaCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetMediaCollectionViewCell.self), for: indexPath) as! PetMediaCollectionViewCell
            //cell.configure()
            return cell
        case .petLoadMediaCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetLoadMediaCollectionViewCell.self), for: indexPath) as! PetLoadMediaCollectionViewCell
            return cell
        }
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension SettingsPetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.petMediaCollectionViewCellSize, height: UIConstants.petMediaCollectionViewCellSize)
    }
}
