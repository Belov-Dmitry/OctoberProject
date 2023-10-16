//
//  PetMediaCollectionViewCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 14.10.2023.
//

import UIKit
import SnapKit

class PetMediaCollectionViewCell: UICollectionViewCell {
    // MARK: - Public
    func configure() {
        petMedia.image = UIImage(named: "person")
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {

        static let petMediaCollectionViewCellSize = 106
        static let petMediaCollectionViewCellcornerRadius: CGFloat = 6
    }
    
    // MARK: - Private properties
    private let petMedia: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.petMediaCollectionViewCellcornerRadius
        view.clipsToBounds = true
        return view
    }()
    
}

// MARK: - Private methods
private extension PetMediaCollectionViewCell {
    func initialize(){
        contentView.addSubview(petMedia)
        petMedia.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
       
        
        
    }
}
