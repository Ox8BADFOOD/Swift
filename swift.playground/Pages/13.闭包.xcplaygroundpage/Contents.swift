//: [Previous](@previous)

import Foundation

//: # 前言

/*:
 ## 函数的定义
 
 swift 中可以通过一个func定义一个函数,也可以通过一个闭包表达式定义一个函数
 */

// 函数
func sum(_ v1:Int, _ v2:Int) -> Int{v1 + v2}

// 闭包表达式
var fn = {
	(v1: Int, v2:Int) -> Int in
	return v1 + v2
}

// 闭包表达式不用写参数标签
fn(10, 20)
// extraneous argument labels 'v1:v2:' in call fn(v1: 10, v2: 20)
// 无关的参数标签 v1 v2
// fn(v1: 10, v2: 20)

// 匿名闭包表达式?
func test(){
	// error: top-level statement cannot begin with a closure expression {(v1: Int, v2:Int) -> Int in
	// (顶级声明不能用闭包表达式)
	{(v1: Int, v2:Int) -> Int in
		return v1 + v2
	}(10,20)
}


/*:
 ## 闭包

- 一个函数和他所捕获的常量/变量环境组合起来,称为闭包
- 一个封闭的环境,包住了某个变量,把他捕获
- 闭包和闭包表达式不一样
	- 闭包表达式:	 参数和表达式组成的函数
	- 闭包:		 把捕获的参数和返回的函数组合在一起
- 一般指定义在函数中的函数
- 一般它捕获的是外层函数的局部变量/常量
 */

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

/*
 ## 闭包的内存
 
 #### 内存大小的获取
 */

// var 闭包 内存前8位间接调用方法fn1；后8位存储闭包堆控件地址
var 闭包 = 创建闭包()
// 闭包占16个字节
print(MemoryLayout.size(ofValue: 闭包))

//: [Next](@next)
