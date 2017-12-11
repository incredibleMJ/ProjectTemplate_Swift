//
//  TestViewController.swift
//  ProjectTemplate_Swift
//
//  Created by Albert on 2017/12/1.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit
import MJRefresh

class TestViewController: BaseViewController {
    var repos: [GitHubRepo] = [GitHubRepo]()
    var tableView: UITableView = UITableView()
    var popupController: CNPPopupController?
    
    override func viewDidLoad() {
        self.title = "Github"
        addTableView()
    }
    
    func addTableView() {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: Constant.SCREEN_WIDTH, height: Constant.SCREEN_HEIGHT), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(self.tableView)
        
        //下拉刷新
        let header = MJRefreshNormalHeader.init(refreshingBlock: {
            gitHubProvider.request(.userRepositories("incrediblemj")) { (result) in
                switch result {
                case .success(let moyaResponse):
                    do {
                        let models = try JSONDecoder().decode([GitHubRepo].self, from: moyaResponse.data)
                        self.repos.removeAll()
                        self.repos.append(contentsOf: models)
                        self.tableView.reloadData()
                    } catch {
                        Utilities.showText("\(error.localizedDescription)")
                    }
                case .failure(let error):
                    Utilities.showText("\(error.localizedDescription)")
                }
                self.tableView.mj_header.endRefreshing()
            }
        })
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView.mj_header = header
        
        //table header
        let imgv = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: Constant.SCREEN_WIDTH, height: 200))
        imgv.contentMode = .scaleAspectFill
        imgv.clipsToBounds = true
        imgv.image = UIImage.init(named: "Taylor Swift8.jpeg")
        tableView.tableHeaderView = imgv
    }
    
    func showPopupWithStyle(_ popupStyle: CNPPopupStyle) {
        
        //准备弹框内容
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.alignment = NSTextAlignment.center
        
        let title = NSAttributedString(string: "It's A Popup!", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24), NSAttributedStringKey.paragraphStyle: paragraphStyle])
        
        let button = CNPPopupButton.init(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("Close Me", for: UIControlState())
        
        button.backgroundColor = UIColor.orange
        
        button.layer.cornerRadius = 4;
        button.selectionHandler = { (button) -> Void in
            self.popupController?.dismiss(animated: true)
        }
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0;
        titleLabel.attributedText = title
        
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 250, height: 250))
        imageView.image = UIImage.init(named: "Taylor Swift7.jpeg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let customView = UIView.init(frame: CGRect(x: 0, y: 0, width: 250, height: 55))
        customView.backgroundColor = UIColor.lightGray
        
        let textField = UITextField.init(frame: CGRect(x: 10, y: 10, width: 230, height: 35))
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Custom view!"
        customView.addSubview(textField)
        
        //创建弹框
        let popupController = CNPPopupController(contents:[titleLabel, imageView, customView, button])
        popupController.theme = CNPPopupTheme.default()
        
        popupController.theme.maskType = .dimmed//.clear
        popupController.theme.blurEffectAlpha = 1
        popupController.theme.backgroundColor = UIColor.white
        popupController.theme.cornerRadius = 4
        popupController.theme.popupContentInsets = UIEdgeInsetsMake(16, 16, 16, 16)
        popupController.theme.presentationStyle = .slideInFromTop
        popupController.theme.dismissesOppositeDirection = true
        popupController.theme.contentVerticalPadding = 12
        popupController.theme.maxPopupWidth = 300
        popupController.theme.animationDuration = 0.5
        popupController.theme.shouldDismissOnBackgroundTouch = true
        popupController.theme.movesAboveKeyboard = true
        
        popupController.theme.popupStyle = popupStyle
        popupController.delegate = self
        self.popupController = popupController
        popupController.present(animated: true)
    }
    
}

//MARK: - UITableViewDataSource
extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = repos[indexPath.row].name
        return cell
    }
}

//MARK: - UITableViewDelegate
extension TestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.showPopupWithStyle(.actionSheet)
        case 1:
            self.showPopupWithStyle(.centered)
        case 2:
            self.showPopupWithStyle(.fullscreen)
        default:
            self.showPopupWithStyle(.centered)
        }
        
    }
}

//MARK: - CNPPopupControllerDelegate
extension TestViewController : CNPPopupControllerDelegate {
    
    func popupControllerWillDismiss(_ controller: CNPPopupController) {
        print("Popup controller will be dismissed")
    }
    
    func popupControllerDidPresent(_ controller: CNPPopupController) {
        print("Popup controller presented")
    }
    
}
