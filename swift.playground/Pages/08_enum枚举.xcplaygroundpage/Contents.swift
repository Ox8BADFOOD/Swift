//: [Previous](@previous)

import Foundation

/*:
 # 枚举
 
 ## 关联值
 有时候将’枚举的成员值‘跟’其他类型的值‘关联存储起来，非常有用
 */

/*:
 ## 原始值
 枚举成员可以使用’相同类型‘的默认值预先对应，这个值叫做原始值
 */

//: 隐式原始值
enum Season: Int{ case spring, summer, autumn, winter }
enum Direction: String { case north, south, east,west }

//: 递归枚举
indirect enum CalculateExp{
    case number(Int)
    case sum(CalculateExp, CalculateExp)
    case diffrence(CalculateExp, CalculateExp)
}

//: 关联值起标签
enum Time {
    case date(year:Int, month:Int, day:Int)
    case duration(describe: String)
}

let time = Time.date(year: 1970, month: 1, day: 28)


switch time{
case .date(year: var y, month: let m, day: _):
    y = y + 1
    print("year:\(y) month:\(m)")
default:
    break
}

//: [Next](@next)
