//
//  Object.swift
//  Switching Button
//
//  Created by Xchel Carranza on 30/12/22.
//

struct Object: SelectableNameProtocol {
    func toString() -> String {
        return title
    }
    
    var chipTitle: String {
        get {
            title
        }
    }
    
    let title: String
    let description: String
}
