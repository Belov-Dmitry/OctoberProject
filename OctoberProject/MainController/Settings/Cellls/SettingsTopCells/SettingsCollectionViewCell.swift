//
//  SettingsCollectionViewCell.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 19.11.2023.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {
    //MARK: - Private constants
        private enum UIConstants {
            static let logoImageViewSize: CGFloat = 80
            static let logoNameLabelFontSize: CGFloat = 13
            static let circleSize: CGFloat = 88
        }
    //MARK: - Private properties
    
        private var logoImageView: UIImageView = {
            let view = UIImageView()
            view.layer.cornerRadius = UIConstants.logoImageViewSize / 2
            view.clipsToBounds = true //чтобы сработало закругление для картинки
            return view
        }()
        
        private let logoNameLabel: UILabel = {
           let label = UILabel()
            label.font = .systemFont(ofSize: UIConstants.logoNameLabelFontSize)
            label.textAlignment = .center //расположение текста по центру
            return label
        }()
        
        private let circleImageView: UIImageView = {
            let view = UIImageView()
//            view.layer.cornerRadius = UIConstants.circleSize / 2
//            view.clipsToBounds = true
            view.image = UIImage(named: "isSelectedImage")
            return view
        }()
    //MARK: - Init
        override init(frame: CGRect) {
            super.init(frame: frame)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    func configure(with info: SettingsTopCellStruct) {
        logoImageView.image = info.foto
        logoNameLabel.text = info.name
        circleImageView.isHidden = !info.isSelectedCell
    }
}
//MARK: - Private methods
private extension SettingsCollectionViewCell {
    func initialize() {
        contentView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.logoImageViewSize)
            make.top.left.equalToSuperview()
        }
        contentView.addSubview(logoNameLabel)
        logoNameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
        contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(logoImageView)
            make.size.equalTo(UIConstants.circleSize)
        }
    }
}
