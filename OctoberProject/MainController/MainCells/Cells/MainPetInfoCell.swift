//
//  MainPetInfoCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 01.11.2023.
//
import UIKit
import SnapKit

protocol MainPetInfoCellDelegate: AnyObject {
    func petInfoViewLabelTap()
}

class MainPetInfoCell: UITableViewCell {
    weak var delegate: MainPetInfoCellDelegate?
    private enum UIConstants {
        static let petImageSize: CGFloat = 80
        static let petNameLabelFontSize: CGFloat = 22
        static let petLocationLabelFontSize: CGFloat = 13
        static let petInfoTitleLabelFontSize: CGFloat = 13
        static let petInfoViewLabelFontSize: CGFloat = 16
        static let textGreyColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
        static let textBlueColor = UIColor(red: 49/255, green: 101/255, blue: 200/255, alpha: 1)
        static let petGenderViewSize: CGFloat = 11
        static let petLocationImageWidth: CGFloat = 10
        static let petLocationImageHeight: CGFloat = 15
        static let petMediaCollectionViewCellSize: CGFloat = 106
        static let petPencilImageSize: CGFloat = 11
    }
    private let petImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petImageSize / 2
        view.clipsToBounds = true
        view.backgroundColor = .systemGray2
        return view
    }()
    private let petNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petNameLabelFontSize, weight: .bold)
        return label
    }()
    private let petGenderView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private let petLocationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petLocationLabelFontSize)
        label.textColor = UIConstants.textGreyColor
        return label
    }()
    private let petLocationImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "locationImage")
        return view
    }()
    private let petInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petInfoTitleLabelFontSize)
        label.text = "О питомце"
        //label.textColor = .dark
        return label
    }()
    private let petInfoViewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petInfoViewLabelFontSize)
        return label
    }()
    private let petInfoEditButtonImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "editButton")
        return view
    }()
    private var petMediaCollectionView: UICollectionView!
    private let petMediaItems: [PetMediaCollectionItems] = [
        PetMediaCollectionItems(type: .petLoadMediaCell),
        PetMediaCollectionItems(type: .petMediaCell),
        PetMediaCollectionItems(type: .petMediaCell),
        PetMediaCollectionItems(type: .petMediaCell),
        PetMediaCollectionItems(type: .petMediaCell)
    ]
    // MARK: - Init
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            initialize()
            addCollectionView()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    func configure(with info: MainPetInfoCellStruct) {
        petImageView.image = info.petPhoto
        petNameLabel.text = info.petName
        petLocationLabel.text = info.petLocation
        petInfoViewLabel.text = info.petData
        petGenderView.image = UIImage(named: info.petGender)

        setupPetInfoViewLabelTap()
    }
    // MARK: - Tap methods
        func setupPetInfoViewLabelTap() {
            if petInfoViewLabel.text == "Нажмите, чтобы редактировать" {
                petInfoViewLabel.font = UIFont(name: "SF UI Text", size: 16)
                petInfoViewLabel.textColor = UIConstants.textBlueColor
                let petInfoViewLabelTap = UITapGestureRecognizer(target: self, action: #selector(self.petInfoViewLabelTap(_:)))
                self.petInfoViewLabel.isUserInteractionEnabled = true
                self.petInfoViewLabel.addGestureRecognizer(petInfoViewLabelTap)
            }
            else {
                petInfoViewLabel.font = UIFont(name: "SF UI Text", size: 8)
                petInfoViewLabel.textColor = UIConstants.textGreyColor
                petInfoViewLabel.numberOfLines = 5
                
                contentView.addSubview(petInfoEditButtonImage)
                petInfoEditButtonImage.snp.makeConstraints{ make in
                    make.trailing.equalToSuperview().inset(20)
                    make.top.equalToSuperview().offset(20)
                    make.size.equalTo(UIConstants.petPencilImageSize)
                }
                let petInfoEditButtonImageTap = UITapGestureRecognizer(target: self, action: #selector(self.petInfoViewLabelTap(_:)))
                self.petInfoEditButtonImage.isUserInteractionEnabled = true
                self.petInfoEditButtonImage.addGestureRecognizer(petInfoEditButtonImageTap)
                print("2")
            }
        }
    @objc func petInfoViewLabelTap(_ sender: UITapGestureRecognizer) {
        print("label pressed petInfo")
        delegate?.petInfoViewLabelTap()
    }
    
  
}
private extension MainPetInfoCell {

    func initialize() {
        selectionStyle = .none
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(petImageView)
        petImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
            make.size.equalTo(UIConstants.petImageSize)
        }
        contentView.addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(petImageView.snp.trailing).offset(20)
            make.top.equalTo(petImageView).offset(15)
        }
        contentView.addSubview(petGenderView)
        petGenderView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.petGenderViewSize)
            make.top.equalTo(petNameLabel)
            make.leading.equalTo(petNameLabel.snp.trailing)
        }
        contentView.addSubview(petLocationLabel)
        petLocationLabel.snp.makeConstraints{ make in
            make.leading.equalTo(petNameLabel).inset(20)
            make.top.equalTo(petNameLabel).offset(30)
        }
        contentView.addSubview(petLocationImage)
        petLocationImage.snp.makeConstraints { make in
            make.centerY.equalTo(petLocationLabel)
            make.leading.equalTo(petLocationLabel).offset(-20)
            make.width.equalTo(UIConstants.petLocationImageWidth)
            make.height.equalTo(UIConstants.petLocationImageHeight)
        }
        contentView.addSubview(petInfoTitleLabel)
        petInfoTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(petImageView)
            make.top.equalTo(petImageView.snp.bottom).offset(20)
        }
        contentView.addSubview(petInfoViewLabel)
        petInfoViewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(petInfoTitleLabel.snp.bottom).offset(10)
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
            make.top.equalTo(petInfoViewLabel.snp.bottom).offset(20)
            make.height.equalTo(UIConstants.petMediaCollectionViewCellSize)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
// MARK: - UICollectionViewDataSource
extension MainPetInfoCell: UICollectionViewDataSource {
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
extension MainPetInfoCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.petMediaCollectionViewCellSize, height: UIConstants.petMediaCollectionViewCellSize)
    }
}

