//: [Previous](@previous)

import Foundation

/*:
 # 枚举
 
 >在 Swift 中，枚举类型是'一等（first-class）类型'。
 
 它们采用了很多在传统上只被类（class）所支持的特性，例如:
- 计算属性（computed properties），用于提供枚举值的附加信息，
- 实例方法（instance methods），用于提供和枚举值相关联的功能。
- 枚举也可以定义构造函数（initializers）来提供一个初始值；
- 可以在原始实现的基础上扩展它们的功能；
- 还可以遵循协议（protocols）来提供标准的功能。
 
 */

/*:
 ## 原始值
 枚举成员可以使用’相同类型‘的默认值预先对应，这个值叫做原始值
 */

//: 原始值的隐式赋值
enum Season: Int{
    case spring, summer, autumn, winter
    
    var calculateStr :Int{
        self.rawValue
    }
    
    func describe() {
        print("my favorite season is \(self)")
    }
}

print(Season.summer.calculateStr)
Season.summer.describe()

enum Direction: String { case north, south, east,west }

/*:
 ## 关联值
 有时候将’枚举的成员值‘跟’其他类型的值‘关联存储起来，非常有用
 */

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
