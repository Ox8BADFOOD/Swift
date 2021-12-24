//: [Previous](@previous)

import Foundation

// switch 也支持Character、String

let str = "Jack"

switch str{
case "Jack":
    print(str)
default:
    print("nobody")
}

let cha = "A"

switch cha{
case "a","A":
    print(cha)
default:
    break
}


// switch 也支持区间、元祖
let count = 60

switch count {
    
case 0:
    print("none")
case 1..<5:
    print("a few")
case 5..<100:
    print("several")
default:
    // 不处理可以直接写break
    break
}


// 绑定值
let point = (2, 0)

switch point {
// 必要是let 也可以改为 var
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case (let x,let y):
    print("somewhere else at (\(x),\(y)")
}

// where
let anchor = (1, -1)
switch anchor{
case (let x, let y) where x == y:
    print("on the line x == y")
case (let x, let y) where x == -y:
    print("on the line x == -y")
case (let x,let y):
    print("somewhere else at (\(x),\(y)")
}

//: [Next](@next)
