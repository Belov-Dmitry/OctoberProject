//
//  ViewController.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 05.10.2023.
//

import UIKit
import SnapKit

final class MessageViewController: UIViewController {

//    var sections = [["fsndos", "ewkwed"], ["wefg", "ewfef", "fhje", "wefg", "ewfef", "fhje"]]
    
    private let collection = CollectionViewCompositionalLayout()
    private let text = UIFont.systemFont(ofSize: 18)
    
    private let heightSegment = 87
    private let thickness: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureApperance()
    }
}

private extension MessageViewController {
    
    func configureApperance() {
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
