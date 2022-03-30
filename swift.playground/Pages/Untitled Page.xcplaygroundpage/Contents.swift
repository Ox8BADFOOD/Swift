//: [Previous](@previous)

import Foundation

class Person{
    
    var fn :()->() = {
        
    }
    
    func run (){
        print("run")
    }
    
    deinit {
        print("deinit")
    }
}

var p = Person()

//: [Next](@next)
