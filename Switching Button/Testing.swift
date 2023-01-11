//
//  Testing.swift
//  Switching Button
//
//  Created by Xchel Carranza on 29/12/22.
//

import Foundation

// MARK: generic protocol
class TestClass: TestDelegate {
    
    typealias T = TestStruct
       
   func main() {
       let test = TestClass2<T>()
       let data = TestStruct(id: 0, name: "Xchel")
       test.test2(data: data, delegate: self)
   }
    
    func test(data: TestStruct) {
        print("**[TEST]", data.testName)
    }
}

class TestClass2<T> {
   
    func test<D, P>(data1: P, data2: D.T, delegate: D) where D: TestDelegate, P: TestProtocol {
        let test3 = TestClass3()
        test3.test(data: data2, delegate: delegate)
    }
    
//    var delegate: D?
    
    func test2<D>(data: D.T, delegate: D) where D: TestDelegate {
//        self.delegate = delegate
        if let data = data as? TestProtocol {
            print("**[TEST]", data.testName)
        } else {
            fatalError("The object \(data.self) doesn't conform the protocol or belong to the delegate")
        }
        
        let test3 = TestClass3()
        test3.test(data: data, delegate: delegate)
    }
}

class TestClass3 {
    func test<D>(data: D.T, delegate: D) where D: TestDelegate {
        delegate.test(data: data)
    }
}

protocol TestDelegate {
   associatedtype T
   func test(data: T)
}

protocol TestProtocol {
    var testName: String { get }
}

struct TestStruct: TestProtocol {
    
    var testName: String {
        get { name }
    }
    let id: Int
    let name: String
}
// MARK: generic protocol
