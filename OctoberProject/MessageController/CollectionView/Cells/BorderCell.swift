//
//  BorderCollectionCell.swift
//  OctoberProject
//
//  Created by Mishana on 18.10.2023.
//

import UIKit
import SnapKit

final class BorderCell: UICollectionViewCell {
    
    static let cellID = "BorderCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
       configureAppearance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BorderCell {
    func configureAppearance() {
        backgroundColor = Resources.Colors.lightGray
    }
}
