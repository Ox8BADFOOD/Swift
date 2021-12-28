//: [Previous](@previous)

import Foundation

enum Password{
    case number(Int,Int,Int,Int)
    case other
}

enum Season: Int{ case spring, summer, autumn, winter }
enum Direction: String { case north, south, east,west }
enum Simple:String { case num, string, boool}

// Int 32位机上就是Int32，64位就是Int64,
// Int64 刚好64/8 = 8个字节
MemoryLayout<Int>.stride

// 内存中分配占用的大小
MemoryLayout<Password>.stride
// 实际使用的大小
MemoryLayout<Password>.size
// 内存对齐
MemoryLayout<Password>.alignment

var pwd = Password.number(1, 2, 3, 4)
MemoryLayout.stride(ofValue: pwd)
MemoryLayout.size(ofValue: pwd)
MemoryLayout.alignment(ofValue: pwd)

pwd = .other
MemoryLayout.stride(ofValue: pwd)
MemoryLayout.size(ofValue: pwd)
MemoryLayout.alignment(ofValue: pwd)

// Int64占8个字节，为什么这里只占用一个呢？ 因为一个字节足够表达所有类型，真正的返回值可能以字面量形式写在代码段
let s = Season.init(rawValue: 0)
MemoryLayout.stride(ofValue: s)
MemoryLayout.size(ofValue: s)
MemoryLayout.alignment(ofValue: s)

let d = Direction.south
MemoryLayout.stride(ofValue: d)
MemoryLayout.size(ofValue: d)
MemoryLayout.alignment(ofValue: d)

let simple = Simple.num
MemoryLayout.stride(ofValue: simple)
MemoryLayout.size(ofValue: simple)
MemoryLayout.alignment(ofValue: simple)

//: [窥探内存小工具](https://github.com/CoderMJLee/Mems)

//: lldb 查看内存指令： fr v -R （frame variable -R）
enum TestEnum{
    case test0
    case test1
    case test2
    case test4(Int)
    case test5(Int, Int)
    case test6(Int, Int, Int, Bool)
}

var test = TestEnum.test6(1, 2, 3, true)
show(val:&test)

test = TestEnum.test6(1, 2, 3, false)
show(val:&test)

enum TestEnum2{
    case test0
    case test1
    case test2
    case test4(Int)
    case test5(Int, Int)
    case test6(Int, Int, Bool, Int)
}

var test2 = TestEnum2.test6(1, 2, true,3)
show(val:&test2)


enum TestEnum3{
    case test0
    case test1
    case test2
    case test4(Int)
    case test5(Int, Int)
    case test6(Int, Bool, Int)
}

var test3 = TestEnum3.test6(1, true, 2)
show(val:&test3)
//: [Next](@next)
