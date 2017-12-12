//: Playground - noun: a place where people can play

import UIKit

var a = 10
var b = 20

var c = 0

if a > b {
    c = a - b
}
else {
    c = b - a
}

if a > b {
    print("a is greater")
}
else if a == b {
    print("both are equal")
}
else {
    print("b is greater")
    if b > 100 {
        print(" and b is greater than 100")
    }
    else {
        print(" and b is smaller than 100s")
    }
}

print("Result: \(c)")


// Loops


/*
 initialisation
 
 while condition {
     statements
     incr/decr
 }
 
*/
a = 0
while a < 10 {
    print("Codekul")
    a += 1
}

/*
 initialisation
 
 repeat {
 
     statements
     incr/decr
 
 } while condition
 */
a = 20
repeat {
    
    print("iOS")
    a += 1
} while a < 10

/*
 
 switch option {
 case pattern:
     statements
 case default:
     statements
 }
 */

/*
 for item in collection {
     statements
 }
 */

var arrData = [["name" : "Sachin", "runs" : "10000"],["name" : "Virat", "runs" : "9000"]]

for (index, player) in arrData.enumerated() {
    
    print("\(index + 1)) Name: \(player["name"]!)\nRuns: \(player["runs"]!)\n")
}

var myRange = 50..<100

for (i, data) in myRange.enumerated() {
    
    if data % 2 == 0 {
        print("\(i) - \(data)")
    }
}

var range = 10..<50

a = 3
switch a {
case 0...5:
    print("One")
case 2:
    print("Two")
    fallthrough
case 3:
    print("Three")
    fallthrough
case 4:
    print("Four")
case 5:
    print("Five")
case 6:
    print("Six")
case 7:
    print("Seven")
case 8:
    print("Eight")
case 9:
    print("Nine")
default:
    print("Zero")
}

var str = "One"
switch str {
case "One":
    print("1")
default:
    print("0")
}
