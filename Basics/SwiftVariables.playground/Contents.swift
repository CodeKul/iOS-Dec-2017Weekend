//: Playground - noun: a place where people can play

import UIKit

var str : Int?

str = nil

if str == nil {
    str = 0
}

var str1 = str! + 10

var str2 : Any

str2 = "sdsd"

str2 = 2.0

print(str2)

var str3 = str2 as! Double + 10

var t = ("Sachin", "Virat", "Yuvraj", 20, 30, 40)

t.5 = 50
t
