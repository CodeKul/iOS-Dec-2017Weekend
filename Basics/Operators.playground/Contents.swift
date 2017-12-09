//: Playground - noun: a place where people can play

import UIKit

var a = 10, b = 20, c = 0

//Assignment & Arithmetic

c = a + b
c = a - b
c = a * b
c = a / b
c = a % b

//Compound Assignment

c += a      // c = c + a
c -= b
c *= a
c /= b
c %= a

c += 1

//Comparision

/*
     <
     >
     ==
     !=
     <=
     >=
 */

a = 10
b = 20

var res = a != b

//Ternary

var res1 = a == 30 ? 20 : 30

//Logical

/*
     &&
     ||
     !
 
     p  q   &&  ||  !p
     0  0   0   0   1
     0  1   0   1   1
     1  0   0   1   0
     1  1   1   1   0
 */

var res2 = !(a == 10) || (b != 20) ? 20 : 30
