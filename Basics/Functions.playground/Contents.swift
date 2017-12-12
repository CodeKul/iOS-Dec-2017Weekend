//: Playground - noun: a place where people can play

import UIKit

func display() {
    print("Codekul")
}

display()
display()
display()

func functionWith(param1 : String, param2 : Int) {
    
    print("Pram : \(param1)\nData: \(param2)")
}

func functionWithoutParamsInCall(_ param1 : String, _ param2 : Int) {
    
    print("Pram : \(param1)\nData: \(param2)")
}


functionWith(param1: "iOS 2017", param2: 20)

functionWithoutParamsInCall("Codekul Pune", 100)


func functionWithReturningValue() -> String {
    
    return "Codekul"
}

var str = functionWithReturningValue()

print(str)

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 < s2
    })

reversedNames

