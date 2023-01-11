//
//  User.swift
//  Switching Button
//
//  Created by Xchel Carranza on 29/12/22.
//

struct User: SelectableNameProtocol {
    var chipTitle: String {
        get {
            return name
        }
    }
    
    let id: Int
    let name: String
//    let description: String
    
    func toString() -> String {
        name
    }
}
