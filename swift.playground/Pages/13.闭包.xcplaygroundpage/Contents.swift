//: [Previous](@previous)

import Foundation

// swift 中可以通过一个func定义一个函数,也可以通过一个闭包表达式定义一个函数

func sum(_ v1:Int, _ v2:Int) -> Int{v1 + v2}

var fn = {
	(v1: Int, v2:Int) -> Int in
	return v1 + v2
}

// 闭包表达式不用谢参数标签
fn(10, 20)

// extraneous argument labels 'v1:v2:' in call fn(v1: 10, v2: 20)
// 无关的参数标签 v1 v2
// fn(v1: 10, v2: 20)


func test(){
	// 匿名闭包表达式?
	// error: top-level statement cannot begin with a closure expression {(v1: Int, v2:Int) -> Int in
	// (顶级声明不能用闭包表达式)
	{(v1: Int, v2:Int) -> Int in
		return v1 + v2
	}(10,20)
}

test()

/*:
一个函数和他所捕获的常量/变量环境组合起来,称为闭包
- 闭包和闭包表达式不一样
	- 闭包表达式:	 参数和表达式组成的函数
	- 闭包:		 把捕获的参数和返回的函数组合在一起
- 一般指定义在函数中的函数
- 一般它捕获的是外层函数的局部变量/常量
 */

func fu() -> ()->(){
	
	// fn1就是闭包
	func fn1(){
		
	}
	
	return fn1
}

//: [Next](@next)
