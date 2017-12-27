//: Playground - noun: a place where people can play

import UIKit

class A {
    
    var a : Int
    
    init() {
        a = 10
    }
    
    init(a : Int) {
        
        self.a = a
    }
    
    init(obj : A) {
        self.a = obj.a
    }
    
    func display() {
        
        print("Data: \(a)")
    }
}

var AObj = A()

AObj.display()

var anotherAObj = A(a: 50)

anotherAObj.display()

var newAObj = A(obj: AObj)

newAObj.display()
