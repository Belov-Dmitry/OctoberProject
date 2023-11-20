//
//  PetDataEditViewController.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 14.11.2023.
//

import UIKit
import SnapKit
//protocol PetDataEditViewControllerDelegate: AnyObject{
//    func saveButtonTap()
//}
class PetDataEditViewController: UIViewController {
    //weak var delegate: PetDataEditViewControllerDelegate?
    private enum UIConstants {
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
    }
    let text: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 16)
        text.layer.cornerRadius = 10
        text.layer.masksToBounds = true
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    @objc func saveButtonTap(_ sender: UITapGestureRecognizer){
        //delegate?.saveButtonTap()
        print("saveButtonTap")
        self.navigationController?.popViewController(animated: true)
    }
}
private extension PetDataEditViewController {
    func initialize(){
        view.backgroundColor = UIConstants.backColor
        navigationItem.title = "О питомце"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTap))

        view.addSubview(text)
        text.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
    }
}
