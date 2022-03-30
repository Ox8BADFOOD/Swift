//
//  Block.swift
//  汇编基础&分析Swift实现
//
//  Created by Max on 2022/1/5.
//

import Foundation

typealias Fn = (Int) -> (Int, Int)
func getFns() -> (Fn, Fn) {
    var num1 = 0
    var num2 = 1
    
    func plus(_ i:Int) -> (Int, Int){
        num1 += i
        num2 += i << 1
        return (num1, num2)
    }
    
    func minus(_ i: Int)->(Int, Int){
        num1 -= i
        num2 -= i << 1
        return (num1, num2)
    }
    return (plus, minus)
}


/*
 
 func 创建闭包() -> ()->(){
     var value = 10
     // fn1就是闭包
     let fn1 = {()->() in
         value += 1
     }
     // 在这个位置下断点，rax的值就是swift_allocObject的函数返回值，也就是block捕获的对象的堆空间地址
     
     // 堆空间内存
     // 前8个字节         间接调用fn1
     // 8-16个字节       引用计数
     // 16-24个字节      捕获的变量
     //0x1093bcda0: 0x0000000100008308 0x0000000000000003
     //0x1093bcdb0: 0x0000000000000010
     return fn1
 }

 // 闭包占16个字节
 // var 闭包 内存前8位间接调用方法fn1；后8位存储闭包堆控件地址
 var 闭包 = 创建闭包()
 print(MemoryLayout.size(ofValue: 闭包))
 */
