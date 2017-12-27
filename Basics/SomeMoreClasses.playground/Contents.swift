//: Playground - noun: a place where people can play

import UIKit

class A {
    
    var a : Int
    
    init() {
        a = 0
    }
    
    init(a : Int) {
        self.a = a
    }
    
    init(obj : A) {
        self.a = obj.a
    }
    
    func display() {
        print("A :: Data : \(a)")
    }
}

class BA : A {
    
    var ba : Int
    
    override init() {
        ba = 0
        super.init()
    }
    
    init(ba : Int) {
        self.ba = ba
        super.init(a: ba)
    }
    
    init(obj : BA) {
        self.ba = obj.ba
        super.init(obj: obj)
    }
    
    override func display() {
        print("BA :: Data : \(ba)")
    }
    
    func privateFunctionForObjV() {
        print("BA :: privateFunctionForObjV")
    }
}

var objA = A()
objA.display()

var objBA = BA()
objBA.display()
objBA.privateFunctionForObjV()

var v : A
v = BA()
v.display()
//v.privateFunctionForObjV()




