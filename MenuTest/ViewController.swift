//
//  ViewController.swift
//  MenuTest
//
//  Created by Simeon Saint-Saens on 3/1/19.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

import UIKit
import SnapKit
import Menu

class ViewController: UIViewController {
    var selectedGroup0 = 0
    var selectedGroup1 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuView(title: nil, image: #imageLiteral(resourceName: "button_icon"), theme: LightMenuTheme(), itemsSource: { [weak self]  () -> [MenuItem] in
            return [
                SelectableMenuItem(name: "Item 1", isSelected: self?.selectedGroup0 == 0, group: 0) { [weak self] in
                    self?.selectedGroup0 = 0
                },
                SelectableMenuItem(name: "Item 2", isSelected: self?.selectedGroup0 == 1, group: 0) { [weak self] in
                    self?.selectedGroup0 = 1
                },
                SeparatorMenuItem(),
                SelectableMenuItem(name: "Item 3", isSelected: self?.selectedGroup1 == 0, group: 1) { [weak self] in
                    self?.selectedGroup1 = 0
                },
                SelectableMenuItem(name: "Item 4", isSelected: self?.selectedGroup1 == 1, group: 1) { [weak self] in
                    self?.selectedGroup1 = 1
                },
                SelectableMenuItem(name: "Item 5", isSelected: self?.selectedGroup1 == 2, group: 1) { [weak self] in
                    self?.selectedGroup1 = 2
                },
                SelectableMenuItem(name: "Item 6", isSelected: self?.selectedGroup1 == 3, group: 1) { [weak self] in
                    self?.selectedGroup1 = 3
                }
            ]
        })
        
        view.addSubview(menu)

        menu.tintColor = .black
        menu.snp.makeConstraints { make in
            make.center.equalToSuperview()
            //Menus don't have an intrinsic height
            make.height.equalTo(40)
        }
    }
}
