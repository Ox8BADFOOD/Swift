//: [Previous](@previous)

import Foundation
import Darwin

/*:
 系统为了优化在,Mac/iOS里malloc函数分配的内存总是16的倍数.
 */
// 堆空间分配1个字节
var greeting = malloc(1)
// 获取greeting申请的内存的大小
var memsSize = malloc_size(greeting)
//print(memsSize)

/*:
 ```
 /// 获得变量的内存地址
 Mems.ptr(ofVal: &<#T##_#>)
 /// 获得引用所指向内存的地址
 Mems.ptr(ofRef: <#T##_#>)
 
 /// 获得变量的内存数据（字符串格式）
 Mems.memStr(ofVal: &<#T##_#>, alignment: <#T##MemAlign?#>)
 /// 获得引用所指向的内存数据（字符串格式）
 Mems.memStr(ofRef: <#T##_#>, alignment: <#T##MemAlign?#>)
 ```
 
 UnsafeRawPointer/UnsafeMutableRawPointer 都是指针类型,详情看 11.指针
*/


func test(){
	class Size{
		var x:Int = 2
		var y:Int = 3
	}
	
	var size = Size()
	
	// 获得size变量的内存地址
	let pointAddress: UnsafeRawPointer = Mems.ptr(ofVal: &size)
	print("指针的地址 pointAddress:\(pointAddress)")
	// 获得size变量的内存数据
	let pointContent: String = Mems.memStr(ofVal: &size)
	print("指针的内存 pointContent:\(pointContent)")
	
	// 获得size引用所指向内存的地址
	let objAddress: UnsafeRawPointer = Mems.ptr(ofRef: size)
	print("size所指向的内存的地址 objAddress:\(objAddress)")
	// 获得size对象在内存中所占的大小
	
/*:
malloc_size 获取对象在堆空间所占内存的大小
```
 func malloc_size(_ ptr: UnsafeRawPointer!) -> Int
```
*/
	let memsSize: Int = malloc_size(objAddress)
	print("c语言函数获取的占用的大小 memsSize:\(memsSize)")
	let memsSize2: Int = Mems.size(ofRef: size)
	print("mj封装方法获取的占用的大小 memsSize2:\(memsSize2)")
	
	// 获得size引用所指向的内存数据（字符串格式）
	// isa类对象			  引用计数			 x					y
	// 0x00000001042bb0a0 0x0000000200000003 0x0000000000000002 0x0000000000000003
	let memsStr: String = Mems.memStr(ofRef: size)
	print("size引用所指向的内存数据memsStr:\(memsStr)")
	
	
}

test()

//: [Next](@next)
