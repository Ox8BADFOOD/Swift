//: [Previous](@previous)

import Foundation


//问题：
/*
 iOS 老哥们 请教个问题
 func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T
 @cappuccino  这个方法为什么可以这么写？
 /// This operator uses short-circuit evaluation: `optional` is checked first,
 /// and `defaultValue` is evaluated only if `optional` is `nil`. For example:
 ///     func getDefault() -> Int {
 ///         print("Calculating default...")
 ///         return 42
 ///     }
 ///
 ///     let goodNumber = Int("100") ?? getDefault()

 ?? 是func 为什么第一个参数放在前面
 
 */

enum MyErr: Error{
    case guYi(String)
}

/*
 public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T
 public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T?) rethrows -> T?
 */

func myLog <T> (body: T?, defaultValue: () throws -> T) rethrows -> T{
    if let b = body{
        return b
    }
    return try defaultValue()
}


print(
    myLog(body: Int("hello"), defaultValue: { return 123 })
)

// swift里的String占16个字节，OC占8个字节
//: [Next](@next)
