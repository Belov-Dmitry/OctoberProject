//
//  SettingsViewController.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 19.11.2023.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    private enum UIConstants {
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
        static let collectionViewHeight: CGFloat = 152
        static let cellWidth: CGFloat = 88
        static let cellHeight: CGFloat = 107
    }
    private var collectionView: UICollectionView!
    private let tableView = UITableView()
    var pressedCellIndex = 0
    var itemsChar: [SettingsTopCellStruct] = [
        SettingsTopCellStruct(
            foto: UIImage(named: "person")!,
            name: "Никита",
            isAddButtonVisible: false,
            isSelectedCell: true),
        SettingsTopCellStruct(
            foto: UIImage(named: "pet")!,
            name: "Арчи",
            isAddButtonVisible: false,
            isSelectedCell: false),
        SettingsTopCellStruct(
            foto: UIImage(named: "AddPetAvatar")!,
            name: "Добавить",
            isAddButtonVisible: true,
            isSelectedCell: false)
    ]
    
    var items: [SettingsModel] = [
        .settingsPersonCell(SettingsPersonCellStruct(
            personPhoto: UIImage(named: "person")!,
            personPhone: "+79339333333",
            personGender: true,
            personName: "Никита",
            personLocation: "Алтайский край, Барнаул",
            personMail: "nikita@inbox.ru",
            currentPass: "currentPass",
            newPass: "")),
        .settingsPetCell(SettingsPetCellStruct(
            petPhoto: UIImage(named: "pet")!,
            petGender: true,
            petBreed: "свинья",
            petName: "Арчи",
            petBirthday: "10112002")),
        .settingsPetCell(SettingsPetCellStruct(
            petPhoto: nil,
            petGender: nil,
            petBreed: nil,
            petName: nil,
            petBirthday: nil))
    ]
    
    var model = MainModel()
    var charArray:[TopCollectionViewItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = UIConstants.backColor
        //itemForTable = items[pressedCellIndex]
        
        
        var personArray:[TopCollectionViewItem] = [model.item]
        var petArray = model.item.pet
        charArray = personArray as [TopCollectionViewItem] + petArray! as [TopCollectionViewItem]
        
        print(personArray[0].name)
        print(personArray.count)
        print(petArray![0])
        print(petArray![1])
        print(petArray?.count)
        print(charArray[0].name)
        print(charArray[1].name)
        print(charArray[2].name)
        print(charArray.count)
           
        
    }
    
    @objc func goBackToMainFromSettings() {
            self.dismiss(animated: true, completion: nil)
        }
}
extension SettingsViewController {
    func configureUI (){
        isModalInPresentation = true //запрет смахивать окно
        let backButton = UIBarButtonItem(image: UIImage(named: "SettingsBackButton"), style: .plain, target: self, action: #selector(goBackToMainFromSettings))
                self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.title = "Настройки"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //горизонтальный скрол
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20) //отступы ячейки коллекции
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: SettingsCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false //индикатор скрола
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIConstants.backColor
        tableView.register(SettingsTopCell.self, forCellReuseIdentifier: String(describing: SettingsTopCell.self))
        tableView.register(SettingsPersonCell.self, forCellReuseIdentifier: String(describing: SettingsPersonCell.self))
        tableView.register(SettingsPetCell.self, forCellReuseIdentifier: String(describing: SettingsPetCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
//MARK: UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return " "
//        case 1: return " "
//        default: return nil
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        0
//    }
}
//MARK: UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = items[indexPath.section]
//        switch item {
//        case .settingsPersonCell(let info):
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsPersonCell.self), for: indexPath) as! SettingsPersonCell
//            //_ = indexPath.section
//            cell.configure(with: info)
//            //cell.delegate = self
//            return cell
//        case .settingsPetCell(let info):
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsPetCell.self), for: indexPath) as! SettingsPetCell
//            //_ = indexPath.section
//            cell.configure(with: info)
//            //cell.delegate = self
//            return cell
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[pressedCellIndex]
        switch item {
        case .settingsPersonCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsPersonCell.self), for: indexPath) as! SettingsPersonCell
            cell.configure(with: info)
            return cell
        case .settingsPetCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsPetCell.self), for: indexPath) as! SettingsPetCell
            cell.configure(with: info)
            return cell
        }
    }
}
// MARK: - UICollectionViewDataSource
extension SettingsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //itemsChar.count
        charArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SettingsCollectionViewCell.self), for: indexPath) as! SettingsCollectionViewCell
        cell.configure(with: charArray[indexPath.item])
        //cell.configure(with: itemsChar[indexPath.item])
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension SettingsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        print(charArray[indexPath.row].name)
        print(charArray[indexPath.item].isAddButtonVisible)
        
        if charArray[indexPath.item].isAddButtonVisible ?? false {
            print("isAddButtonVisible = true")
        }
        pressedCellIndex = indexPath.row
        
        
        charArray.indices.forEach { index in
            charArray[index].isSelectedCell = false
        }
        charArray[indexPath.item].isSelectedCell = true
        collectionView.reloadData()
        tableView.reloadData()
        
        
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension SettingsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
