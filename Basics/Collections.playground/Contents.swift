//: Playground - noun: a place where people can play

import UIKit

var array = [1,2,3,4,5,6,7,8,9]


array.append(10)

array.insert(0, at: 0)

var newArray = Array<Any>()

newArray.append("Str")

newArray.append(20)

newArray.append(10.40)

var a = newArray[0] as! String

a

var dict : [String : Any]

dict = ["one" : 1,"two":"2"]

dict["two"]

var newDict : [String : Double]

newDict = [String : Double]()

newDict["marksObtained"] = 90.57
newDict["totalMarks"] = 100.0

newDict

var set = Set<Int>()

set.insert(10)
set.insert(40)
set.insert(70)
set.insert(20)
set.insert(80)

var newSet = Set<Int>()

newSet.insert(30)
newSet.insert(70)
newSet.insert(90)
newSet.insert(40)
newSet.insert(100)
newSet.insert(50)

set.intersection(newSet)

set.symmetricDifference(newSet)

set.union(newSet)

set.subtracting(newSet)
