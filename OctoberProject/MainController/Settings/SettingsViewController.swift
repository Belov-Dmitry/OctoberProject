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
    }
    private let tableView = UITableView()
    
    var items: [SettingsModel] = [
        .settingsTopCell([
            SettingsTopCellStruct(
                foto: UIImage(named: "person")!,
                name: "Никита",
                isAddButtonVisible: false,
                isSelectedCell: false),
            SettingsTopCellStruct(
                foto: UIImage(named: "pet")!,
                name: "Арчи",
                isAddButtonVisible: false,
                isSelectedCell: false),
            SettingsTopCellStruct(
                foto: UIImage(named: "AddPetAvatar")!,
                name: "Добавить",
                isAddButtonVisible: true,
                isSelectedCell: false),]),
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
            petBirthday: "10112002"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = UIConstants.backColor
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
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
//MARK: UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return " "
        case 1: return " "
        case 2: return " "
        default: return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
}
//MARK: UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item {
        case .settingsTopCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTopCell.self), for: indexPath) as! SettingsTopCell
            //_ = indexPath.section
            cell.configure(with: info)
            //cell.delegate = self
            return cell
        case .settingsPersonCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsPersonCell.self), for: indexPath) as! SettingsPersonCell
            //_ = indexPath.section
            cell.configure(with: info)
            //cell.delegate = self
            return cell
        case .settingsPetCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsPetCell.self), for: indexPath) as! SettingsPetCell
            //_ = indexPath.section
            cell.configure(with: info)
            //cell.delegate = self
            return cell
        }
    }
}
