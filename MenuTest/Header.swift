//
//  Header.swift
//  MenuTest
//
//  Created by Jean-Philippe Meunier on 15/02/2019.
//  Copyright © 2019 Two Lives Left. All rights reserved.
//

import UIKit
import Menu

class Header: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var view: UIView!
    private var menuView: MenuView?

    var selectedGroup0 = 0
    var selectedGroup1 = 0

    func load() {
        if menuView == nil {
            configureMenuView()
        }
    }

    private func configureMenuView() {
        let menuView = MenuView(title: MenuView.Title.text("•••"), theme: LightMenuTheme()) { [weak self] () -> [MenuItem] in
            guard let self = self else {
                return []
            }
            return [
                SelectableMenuItem(name: "Item A1", isSelected: self.selectedGroup0 == 0, group: 0) { [weak self] in
                    self?.selectedGroup0 = 0
                },
                SelectableMenuItem(name: "Item A2", isSelected: self.selectedGroup0 == 1, group: 0) { [weak self] in
                    self?.selectedGroup0 = 1
                },
                SeparatorMenuItem(),
                SelectableMenuItem(name: "Item B1", isSelected: self.selectedGroup1 == 0, group: 1) { [weak self] in
                    self?.selectedGroup1 = 0
                },
                SelectableMenuItem(name: "Item B2", isSelected: self.selectedGroup1 == 1, group: 1) { [weak self] in
                    self?.selectedGroup1 = 1
                },
                SelectableMenuItem(name: "Item B3", isSelected: self.selectedGroup1 == 2, group: 1) { [weak self] in
                    self?.selectedGroup1 = 2
                },
                SelectableMenuItem(name: "Item B4", isSelected: self.selectedGroup1 == 3, group: 1) { [weak self] in
                    self?.selectedGroup1 = 3
                }
            ]
        }
        menuView.contentAlignment = .left
        view.addSubview(menuView)
        menuView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(16)
        }
        self.menuView = menuView
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let menu = menuView else {
            return super.point(inside: point, with: event)
        }

        let menuPoint = convert(point, to: menu)

        if menu.point(inside: menuPoint, with: event) {
            return true
        }

        return super.point(inside: point, with: event)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let menu = menuView else {
            return super.hitTest(point, with: event)
        }

        let menuPoint = convert(point, to: menu)

        if let view = menu.hitTest(menuPoint, with: event) {
            return view
        }

        return super.hitTest(point, with: event)
    }
}
