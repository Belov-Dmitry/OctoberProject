//
//  PetMediaCollectionViewCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 01.11.2023.
//
import UIKit
import SnapKit

class PetMediaCollectionViewCell: UICollectionViewCell {
    private enum UIConstants {
        static let petMediaCollectionViewCellcornerRadius: CGFloat = 6
        static let petMediaCollectionBackColor = UIColor(red: 246/255, green: 246/255, blue: 247/255, alpha: 1)
    }
    private let petMedia: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petMediaCollectionViewCellcornerRadius
        view.clipsToBounds = true
        view.backgroundColor = UIConstants.petMediaCollectionBackColor
        return view
    }()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        petMedia.image = UIImage(named: "person")
    }
}
// MARK: - Private methods
private extension PetMediaCollectionViewCell {
    func initialize(){
        contentView.addSubview(petMedia)
        petMedia.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
