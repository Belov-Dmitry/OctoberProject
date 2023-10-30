//
//  PetLoadMediaCollectionViewCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 15.10.2023.
//

import UIKit

class PetLoadMediaCollectionViewCell: UICollectionViewCell {
    private enum UIConstants {
        static let petMediaCollectionViewCellSize = 106
        static let petMediaCollectionViewCellcornerRadius: CGFloat = 6
    }
    private let petMedia: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petMediaCollectionViewCellcornerRadius
        view.clipsToBounds = true
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
}
// MARK: - Private methods
private extension PetLoadMediaCollectionViewCell {
    func initialize(){
        contentView.addSubview(petMedia)
        petMedia.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        petMedia.image = UIImage(named: "petLoadMedia")
    }
}
