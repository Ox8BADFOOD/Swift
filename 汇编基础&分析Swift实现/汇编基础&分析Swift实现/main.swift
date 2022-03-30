//
//  main.swift
//  汇编基础&分析Swift实现
//
//  Created by Max on 2021/12/29.
//

import Foundation


class Person{
    let age: Int
    
    init(age old: Int) {
        age = old
    }
}

// p就是初始化调用后，rax的值：0x000000010000c790,
// 8个字节，指向堆空间Person对象，可以说p指向Person对象
// p是全局变量
var p = Person(age: 10)
print(p)

// &p 取p的地址
// ptr的值就是变量p的内存地址；
// 并且可以得出withUnsafePointer的第一个参数，作为参数传给了第二个参数（闭包）的参数
var ptr = withUnsafePointer(to: &p) { $0 }

print("p的内存地址:\(Mems.ptr(ofVal: &p))" )
print("ptr的值:\(ptr)")

print("堆空间的地址值：\(Mems.ptr(ofRef: p))")


//print(Mems.memStr(ofVal: &a))
//print(Mems.ptr(ofVal: &a))

//var str2 = "0123456789ABCDEF"
//print(Mems.memStr(ofVal: &str2))
//print("1")
//
//class Person{
//
//    var fn :()->() = {
//
//    }
//
//    func run (){
//        print("run")
//    }
//
//    deinit {
//        print("deinit")
//    }
//}

//var p = Person()
//p = nil

//let (p, m) = getFns()

//testEnum()


/*
 AT&T汇编特点
     寄存器前面加%,如 %rax
     立即数前面带$，如 movq $3, %rax
     寄存器读取：寄存器用()括起来，如0x1ff7(%rip)
 
 常见指令(汇编中是指令加操作数长度 如 movq)
    lea
    mov
    call
    jump
 
 操作数长度
    b = byte(8bit)
    s = short(16bit integer,32bit float point)
    w = word(16bit)
    l = long(32bit integer,64bit float point)
    q = quad(64bit)
    t = ten byte(80bit float point)
 
 简单例子：
    立即数给内存赋值 movq $0xa, 0x1ff7(%rip)
    内存地址给寄存器赋值 leaq -0x18(%rbp),%rax
    跳转: jmp *(rdx) / jmp 0x4001002 / jmp *(%rax)
    调用: call ... ret
 
 rip 作为指令指针
    存储着cpu下一条要执行的指令地址
    一旦cpu读取一条指令（读取肯定再运行前），rip会自动指向下一条指令（存储下一条指令的地址）
 */
