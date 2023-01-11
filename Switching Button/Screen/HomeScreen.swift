//
//  HomeScreen.swift
//  Switching Button
//
//  Created by Xchel Carranza on 30/12/22.
//

import UIKit

class HomeScreen: UIViewController {
    
    private var table: SelectableTableGroup<HomeScreen>!
    
    private var objectList: [Object] {
        var list: [Object] = []
        
        for i in 0...10 {
            list.append(.init(title: "Title \(i)", description: "Some \(i) description"))
        }
        
        return list
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHomeScreen()
        setupTable()
    }
}

extension HomeScreen: SelectableDelegate {
    typealias T = Object
    
    func onSelected(data: Object, selectableButton: SelectableButton) {
        print("*[TEST]", "Works! - (\(data.title))")
    }
    
    private func setupTable() {
        table = SelectableTableGroup(type: .radioButton, list: objectList, delegate: self)
           
        self.view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
    }
}

extension HomeScreen {
    private func setupHomeScreen() {
        self.view.backgroundColor = .systemBackground
        self.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
