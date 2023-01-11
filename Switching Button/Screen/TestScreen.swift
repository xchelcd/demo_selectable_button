//
//  TestScreen.swift
//  Switching Button
//
//  Created by Xchel Carranza on 02/01/23.
//

import UIKit

class TestScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTestScreen()
    }

}

extension TestScreen {
    private func setupTestScreen() {
        self.view.backgroundColor = .systemBackground
        self.title = "Test"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark.circle"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = nil
    }
}
