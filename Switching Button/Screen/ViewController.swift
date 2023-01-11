//
//  ViewController.swift
//  Switching Button
//
//  Created by Xchel Carranza on 26/12/22.
//

import UIKit

extension ViewController : SelectableDelegate {
    typealias T = User

    func onSelected(data: User, selectableButton: SelectableButton) {
        print("*[TEST]", "[\(data.id): \(data.name)] - \(selectableButton.toString())")
//        selectableButton.removeSelection(table!, selectableButton: selectableButton)
    }
}

class ViewController: UIViewController {
    
    typealias D = SelectableDelegate
    
    let width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        
//        setupButton()
        setupTable()
//        setupCollection()
//        setupRadioButtons()
    }
    
    let list : [User] = [
        .init(id: 0, name: "Male"),
        .init(id: 1, name: "Female"),
        .init(id: 2, name: "Alien"),
        .init(id: 2, name: "None")
    ]
    
    private lazy var table: SelectableTableGroup<ViewController>? = nil
    
    private func setupRadioButtons() {
        
        table = SelectableTableGroup(type: .radioButton, list: list, delegate: self)
        
        guard let table = table else { return }
        
        
        self.view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
    }
    
    private func setupTable() {
        let collectionList: [User] = [
            User(id: 0, name: "Xchel"),
            User(id: 13, name: "Lucy"),
            User(id: 1, name: "Eduardo"),
            User(id: 2, name: "Octavio"),
            User(id: 3, name: "Ian"),
            User(id: 4, name: "Milka"),
            User(id: 5, name: "Elena"),
            User(id: 7, name: "Alonso"),
            User(id: 12, name: "Dario"),
            User(id: 8, name: "Correa"),
            User(id: 9, name: "Minaya"),
            User(id: 10, name: "Serrano"),
            User(id: 11, name: "Cordero"),
            User(id: 14, name: "Estefany"),
        ]
        let list: [User] = [
            User(id: 0, name: "Xchel"),
            User(id: 1, name: "Eduardo"),
            User(id: 2, name: "Octavio"),
            User(id: 3, name: "Ian"),
            User(id: 4, name: "Milka"),
            User(id: 5, name: "Elena"),
        ]
        
        let radioList: [User] = [
            .init(id: 0, name: "Mujer"),
            .init(id: 0, name: "Hombre"),
            .init(id: 0, name: "Otro"),
        ]
        
        var users: [User] = []
        for i in 0...50{
            users.append(.init(id: i, name: "User: \(i)"))
        }
        
        let chipTable = SelectableCollectionGroup(type: .chip, list: collectionList, delegate: self)
        let checkboxTable = SelectableTableGroup(type: .checkbox, list: list, delegate: self)
        let radioTable = SelectableTableGroup(type: .radioButton, list: radioList, delegate: self)
//        chipTable.backgroundColor = .green.withAlphaComponent(0.1)
//        checkboxTable.backgroundColor = .cyan.withAlphaComponent(0.1)
//        radioTable.backgroundColor = .brown.withAlphaComponent(0.1)
        self.view.addSubview(chipTable)
        self.view.addSubview(checkboxTable)
        self.view.addSubview(radioTable)
        
        let chipConstraint = chipTable.bottomAnchor.constraint(equalTo: checkboxTable.topAnchor)
        let checkboxConstraint = checkboxTable.bottomAnchor.constraint(equalTo: radioTable.topAnchor)
        let radioConstraint = radioTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
            chipTable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            chipTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            chipTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            //chipTable.bottomAnchor.constraint(equalTo: checkboxTable.topAnchor),
            chipConstraint,
            
            checkboxTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            checkboxTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            checkboxTable.topAnchor.constraint(equalTo: chipTable.bottomAnchor),
            checkboxConstraint,
            
            radioTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            radioTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            radioTable.topAnchor.constraint(equalTo: checkboxTable.bottomAnchor),
            radioConstraint,
        ])
//        chipTable.setupConstraint(forBottom: chipConstraint/*, safeArea: self.view.safeAreaLayoutGuide*/)
        checkboxTable.setupConstraint(forBottom: checkboxConstraint/*, safeArea: self.view.safeAreaLayoutGuide*/)
        radioTable.setupConstraint(forBottom: radioConstraint/*, safeArea: self.view.safeAreaLayoutGuide*/)
    }
    
    private func setupCollection() {
        let list: [User] = [
            User(id: 0, name: "Xchel"),
            User(id: 13, name: "Lucy"),
            User(id: 1, name: "Eduardo"),
            User(id: 2, name: "Octavio"),
            User(id: 3, name: "Ian"),
            User(id: 4, name: "Milka"),
            User(id: 5, name: "Elena"),
            User(id: 7, name: "Alonso"),
            User(id: 12, name: "Dario"),
            User(id: 8, name: "Correa"),
            User(id: 9, name: "Minaya"),
            User(id: 10, name: "Serrano"),
            User(id: 11, name: "Cordero"),
            User(id: 14, name: "Estefany"),
        ]
        
        let chipCollection = SelectableCollectionGroup(type: .chip, list: list, delegate: self)
        self.view.addSubview(chipCollection)

        NSLayoutConstraint.activate([
            chipCollection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            chipCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            chipCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        ])
    }
    
    private func setupButton() {
        let radioButton = SelectableButton(type: .radioButton, title: "This is a radioButton", currentState: false)
        let checkbox = SelectableButton(type: .checkbox, title: "This is a checkbox", currentState: true)
        let chip = SelectableButton(type: .chip, title: "This is a chip", currentState: true)
        let forRadioButton = SelectableButton(forRadioButtonTitle: "Radio Button", currentState: true, textColorSelected: .black, textColorNormal: .black, paddingVertical: 10.0, paddingHorizontal: 5.0, imagePadding: 4.0, fontSize: 10.0)
        let forCheckbox = SelectableButton(forCheckboxTitle: "Checkbox", currentState: true, textColorSelected: .black, textColorNormal: .black, paddingVertical: 10.0, paddingHorizontal: 5.0, imagePadding: 4.0, fontSize: 5.0)
        let forChip = SelectableButton(forChipTitle: "Chip", currentState: false, textColorSelected: .black, textColorNormal: .black, paddingVertical: 5.0, paddingHorizontal: 5.0, imagePadding: 5.0, borderColor: .darkGray, borderWidth: 0.5, backgroundColorSelected: .purple.withAlphaComponent(0.5), backgroundColorNormal: .purple.withAlphaComponent(0.1), borderRadius: nil, fontSize: 15)
        let custom = SelectableButton(forCustomTitle: "Custom", type: .custom, currentState: false, textColorSelected: .label, textColorNormal: .label, borderColor: .black, borderRadius: 12, borderWidth: 2.0, imageColor: .systemBlue, backgroundColorSelected: .purple.withAlphaComponent(0.5), backgroundColorNormal: .purple.withAlphaComponent(0.05), iconSelected: UIImage(systemName: "checklist.checked"), iconNormal: UIImage(systemName: "checklist.unchecked"), paddingVertical: 20.0, paddingHorizontal: 20.0, imagePadding: 5.0, fontSize: 15)

        self.view.addSubview(radioButton)
        self.view.addSubview(checkbox)
        self.view.addSubview(chip)
        self.view.addSubview(forRadioButton)
        self.view.addSubview(forCheckbox)
        self.view.addSubview(forChip)
        self.view.addSubview(custom)

        NSLayoutConstraint.activate([
            radioButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            radioButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            checkbox.topAnchor.constraint(equalTo: radioButton.bottomAnchor, constant: CGFloat(10)),
            checkbox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            chip.topAnchor.constraint(equalTo: checkbox.bottomAnchor, constant: CGFloat(10)),
            chip.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            forRadioButton.topAnchor.constraint(equalTo: chip.bottomAnchor, constant: CGFloat(10)),
            forRadioButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            forCheckbox.topAnchor.constraint(equalTo: forRadioButton.bottomAnchor, constant: CGFloat(10)),
            forCheckbox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            forChip.topAnchor.constraint(equalTo: forCheckbox.bottomAnchor, constant: CGFloat(10)),
            forChip.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            custom.topAnchor.constraint(equalTo: forChip.bottomAnchor, constant: CGFloat(10)),
            custom.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])

        radioButton.onStateChangeListener = { button in
            print("*[TEST]", "radio: \(button.id) - \(button.isChecked())")
        }
        checkbox.onStateChangeListener = { button in
            print("*[TEST]", "check: \(button.id) - \(button.isChecked())")
        }
        chip.onStateChangeListener = { button in
            print("*[TEST]", "chip : \(button.id) - \(button.isChecked())")
        }
        forRadioButton.onStateChangeListener = { button in
            print("*[TEST]", "forRadio: \(button.id) - \(button.isChecked())")
        }
        forCheckbox.onStateChangeListener = { button in
            print("*[TEST]", "forCheck: \(button.id) - \(button.isChecked())")
        }
        forChip.onStateChangeListener = { button in
            print("*[TEST]", "forChip : \(button.id) - \(button.isChecked())")
        }
        custom.onStateChangeListener = { button in
            print("*[TEST]", "custom  : \(button.id) - \(button.isChecked())")
        }
    }
    
    private func chipHasChangeState(chip: SelectableButton) {
        print("*[TEST]", "\(chip.toString())")
    }
    
    private func setupScreen() {
        self.view.backgroundColor = .systemBackground
        self.title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
