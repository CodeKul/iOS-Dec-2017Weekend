//: Playground - noun: a place where people can play

import UIKit

class Complex {
    
    var real : Int
    var imag : Int
    
    init() {
        real = 0
        imag = 0
    }
    
    init(real : Int, imag : Int) {
        self.real = real
        self.imag = imag
    }
    
    init(complex : Complex) {
        self.real = complex.real
        self.imag = complex.imag
    }
    
    func display() {
        print("(\(real) + \(imag)i)")
    }
    
    func addition(complex : Complex) -> Complex {
        
        let result = Complex()
        
        result.real = self.real + complex.real
        result.imag = self.imag + complex.imag
        
        return result
    }
    
    func subtraction(complex : Complex) -> Complex {
        
        let result = Complex()
        
        result.real = self.real - complex.real
        result.imag = self.imag - complex.imag
        
        return result
    }

    func multiplication(complex : Complex) -> Complex {
        
        let result = Complex()
        
        result.real = self.real * complex.real - self.imag * complex.imag
        result.imag = self.real * complex.imag + self.imag * complex.real

        return result
    }
}

var com1 = Complex(real: 1, imag: 2)
var com2 = Complex(real: 3, imag: 1)

com1.display()
com2.display()

//var com3 = com1.addition(complex: com2)
//
//com3.display()
//
//com3 = com1.subtraction(complex: com2)
//com3.display()

var com3 = com1.multiplication(complex: com2)
com3.display()



