//
//  MainViewController.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 09.10.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITabBarControllerDelegate {
    private enum UIConstants {
        static let backColor = UIColor(red: 250/255, green: 250/255, blue: 252/255, alpha: 1)
    }
    private let tableView = UITableView()
    let mainModel = MainModel()
    var mainViewControllerCoordinator: MainViewControllerCoordinator?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        initialize()
        guard let navigationController = self.navigationController else {
            return
        }
        mainViewControllerCoordinator = MainViewControllerCoordinator(navigationController: navigationController)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
              self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: animated)
         super.viewWillDisappear(animated)
    }
    
}
private extension MainViewController {
    func initialize() {
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainHeaderCell.self, forCellReuseIdentifier: String(describing: MainHeaderCell.self))
        tableView.register(MainPersonInfoCell.self, forCellReuseIdentifier: String(describing: MainPersonInfoCell.self))
        tableView.backgroundColor = UIConstants.backColor
        tableView.register(MainPetInfoCell.self, forCellReuseIdentifier: String(describing: MainPetInfoCell.self))
        let heightTabBar = round(view.frame.height / 10)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(heightTabBar)
        }
    }
}
//MARK: UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return ""
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
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = mainModel.items[indexPath.section]  //items[indexPath.section]
        switch item {
        case .mainHeaderCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainHeaderCell.self), for: indexPath) as! MainHeaderCell
            //_ = indexPath.section
            cell.configure(with: info)
            cell.delegate = self
            return cell
        case .mainPersonInfoCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainPersonInfoCell.self), for: indexPath) as! MainPersonInfoCell
            //_ = indexPath.section
            cell.configure(with: info)
            cell.delegate = self
            return cell
        case .mainPetInfoCell(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainPetInfoCell.self), for: indexPath) as! MainPetInfoCell
            //_ = indexPath.section
            cell.configure(with: info)
            cell.delegate = self
            return cell
        }
    }
}
extension MainViewController: MainHeaderCellDelegate {
    func settingsDidTap(){
        mainViewControllerCoordinator?.showSettings()
        print("settingsCoordinator")
    }
//    func settingsDidTap(){
//        let vc = SettingsViewController()
//        let navigationController = UINavigationController(rootViewController: vc)
//        navigationController.modalPresentationStyle = .pageSheet
//        present(navigationController, animated: true)
//        print("tapSettings")
//    }
}
extension MainViewController: MainPersonInfoCellDelegate {
    func personInfoViewLabelTap() {
        print(#function)
        let vc = PersonDataEditViewController()
        //vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true)
    }
}
extension MainViewController: MainPetInfoCellDelegate {
    func petInfoViewLabelTap() {
        print(#function)
        let vc = PetDataEditViewController()
        //vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true)
    }
    
}

