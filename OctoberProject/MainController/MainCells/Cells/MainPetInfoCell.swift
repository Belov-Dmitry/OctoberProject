//
//  MainPetInfoCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 11.10.2023.
//

import UIKit
import SnapKit

class MainPetInfoCell: UICollectionViewCell {
    private enum UIConstants {
        static let petPhoto: CGFloat = 80
        static let petInfoViewHeight = 100
        static let petNameLabelFontSize: CGFloat = 22
        static let petLocationLabelFontSize: CGFloat = 13
        static let petLocationLabelFontColor = UIColor(red: 130/255, green: 137/255, blue: 150/255, alpha: 1)
        static let petInfoTitleLabelFontSize: CGFloat = 13
        static let petMediaCollectionViewCellSize = 106
    }
    private let petInfoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let petPhoto: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petPhoto / 2
        view.clipsToBounds = true
        return view
    }()
    private let petNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petNameLabelFontSize, weight: .bold)
        return label
    }()
    private let genderImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    private let petLocationImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.image = UIImage(named: "locationImage")
        return view
    }()
    private let petLocationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petLocationLabelFontSize, weight: .bold)
        label.textColor = UIConstants.petLocationLabelFontColor
        return label
    }()
    private let petInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.petInfoTitleLabelFontSize, weight: .regular)
        label.text = "О питомце"
        return label
    }()
    private let petInfoViewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        return label
    }()
    private let petInfoEditView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "editButton")
        return view
    }()
    var aboutPetData: String = "Нажмите чтобы редактировать"
    private var petMediaCollectionView: UICollectionView!
    private let petMediaItems: [PetMediaCollectionItem] = [
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetMediaCell),
        PetMediaCollectionItem(type: .PetLoadMediaCell)
    ]
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPetInfoViewLabelTap()
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - Methods
    func configure() {
        petPhoto.image = UIImage(named: "pet")
        let petName = "PetName"
        petNameLabel.text = petName
        genderImage.image = UIImage(named: "genderMale")
        petLocationLabel.text = "Алтайский край, Барнаул"
        petInfoViewLabel.text = aboutPetData
    }
    @objc func petInfoViewLabelTap(_ sender: UITapGestureRecognizer){
        print("label pressed")
    }
    func setupPetInfoViewLabelTap() {
        if aboutPetData == "Нажмите чтобы редактировать" {
            petInfoViewLabel.font = UIFont(name: "SF UI Text", size: 16)
            petInfoViewLabel.textColor = UIColor(red: 49/255, green: 101/255, blue: 200/255, alpha: 1)
            let personInfoViewLabelTap = UITapGestureRecognizer(target: self, action: #selector(self.petInfoViewLabelTap(_:)))
            self.petInfoViewLabel.isUserInteractionEnabled = true
            self.petInfoViewLabel.addGestureRecognizer(personInfoViewLabelTap)
            
            contentView.addSubview(petInfoView)
            petInfoView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalTo(313)
            }
            contentView.addSubview(petInfoViewLabel)
            petInfoViewLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().inset(20)
                make.top.equalToSuperview().inset(146)
            }
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            petMediaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            petMediaCollectionView.register(PetMediaCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PetMediaCollectionViewCell.self))
            petMediaCollectionView.dataSource = self
            petMediaCollectionView.delegate = self
            petMediaCollectionView.register(PetMediaCollectionViewCell.self, forCellWithReuseIdentifier: "PetMedia")
            petMediaCollectionView.register(PetLoadMediaCollectionViewCell.self, forCellWithReuseIdentifier: "PetLoadMedia")
            petMediaCollectionView.showsHorizontalScrollIndicator = false
            contentView.addSubview(petMediaCollectionView)
            petMediaCollectionView.snp.makeConstraints { make in
                make.leading.equalToSuperview()//.inset(20)
                make.top.equalTo(petInfoViewLabel.snp.bottom).offset(20)
                make.height.equalTo(UIConstants.petMediaCollectionViewCellSize)
                make.width.equalToSuperview()
            }
        }
        else {
            petInfoViewLabel.font = UIFont(name: "SF UI Text", size: 8)
            petInfoViewLabel.textColor = UIColor(red: 129/255, green: 138/255, blue: 150/255, alpha: 1)
            petInfoViewLabel.numberOfLines = 5
            
            contentView.addSubview(petInfoView)
            petInfoView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(397)
            }
            contentView.addSubview(petInfoViewLabel)
            petInfoViewLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.top.equalToSuperview().inset(146)
            }
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            petMediaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            petMediaCollectionView.register(PetMediaCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PetMediaCollectionViewCell.self))
            petMediaCollectionView.dataSource = self
            petMediaCollectionView.delegate = self
            petMediaCollectionView.register(PetMediaCollectionViewCell.self, forCellWithReuseIdentifier: "PetMedia")
            petMediaCollectionView.register(PetLoadMediaCollectionViewCell.self, forCellWithReuseIdentifier: "PetLoadMedia")
            petMediaCollectionView.showsHorizontalScrollIndicator = false
            contentView.addSubview(petMediaCollectionView)
            petMediaCollectionView.snp.makeConstraints { make in
                make.leading.equalToSuperview()
                //make.top.equalTo(petInfoViewLabel.snp.bottom).offset(20)
                make.height.equalTo(UIConstants.petMediaCollectionViewCellSize)
                make.width.equalToSuperview()
                make.bottom.equalTo(petInfoView.snp.bottom).inset(20)
            }
            contentView.addSubview(petInfoEditView)
            petInfoEditView.snp.makeConstraints { make in
                make.width.height.equalTo(11)
                make.top.equalTo(petInfoView).inset(15)
                make.right.equalTo(petInfoView).inset(18)
            }
        }
    }
}

// MARK: - Private methods
private extension MainPetInfoCell {
    func initialize(){
        contentView.addSubview(petPhoto)
        petPhoto.snp.makeConstraints { make in
            make.top.equalTo(petInfoView).inset(20)
            make.leading.equalTo(petInfoView).inset(20)
            make.size.equalTo(UIConstants.petPhoto)
        }
        contentView.addSubview(petNameLabel)
        petNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(110)
            make.top.equalToSuperview().inset(35)
        }
        contentView.addSubview(genderImage)
        genderImage.snp.makeConstraints { make in
            make.leading.equalTo(petNameLabel.snp.trailing)
            make.top.equalToSuperview().inset(35)
            make.size.equalTo(11)
        }
        contentView.addSubview(petLocationImage)
        petLocationImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(110)
            make.top.equalToSuperview().inset(69)
            make.width.equalTo(10)
            make.height.equalTo(15)
        }
        contentView.addSubview(petLocationLabel)
        petLocationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(120)
            make.top.equalToSuperview().inset(69)
        }
        contentView.addSubview(petInfoTitleLabel)
        petInfoTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(120)
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
        case .PetMediaCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetMedia", for: indexPath) as! PetMediaCollectionViewCell
            cell.configure()
            return cell
        case .PetLoadMediaCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetLoadMedia", for: indexPath) as! PetLoadMediaCollectionViewCell
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
