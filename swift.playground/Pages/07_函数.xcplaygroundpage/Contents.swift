//: [Previous](@previous)

import Foundation


/*:
 # 可变参数
 - 一个函数最多有一个可变参数
 - 紧跟在可变参数后面的参数不能省略参数标签
 - 例子：swift的print
 */
func sum(_ num: Int...) -> Int {
    var total = 0
    for n in num{
        total += n
    }
    return total
}

print(sum(1,2,3,4,5,6))


/*:
 # 输入输出参数
 
 **可以用inout定义一个输入输出参数：用来在函数内部修改外部实参的值**
 
 注意点:
 - 可变参数不能标记为inout
 - inout参数不能有默认值
 - inout参数只能传入可以被多次赋值的值
 - 本质是地址传递
 */

func swapVal(_ v1:inout Int, _ v2:inout Int){
    let temp = v1
    v2 = v1
    v1 = temp
}


/*:
 # 函数重载
 
 规则
 - 函数名相同
 - 参数个数不同 || 参数类型不同 || 参数标签不同
 - 返回值类型与函数重载无关
 */

/*:
 注意点
 默认参数值和函数重载一起使用产生二义性，编译器并不会报错
 */
func add(v1: Int, v2: Int) -> Int{
    v1 + v2
}

func add(v1: Int, v2: Int, base: Int = 10) -> Int{
    v1 + v2 + base
}

// 会调用不带v3的方法
add(v1:1, v2:2)


/*:
# 内联函数
 
 将函数调用展开成函数体
 
 如果开启了编译器优化（release模式默认会开启优化），编译器会自动将某些函数变成内联函数
 
 - 哪些函数不会被自动内联？
    - 函数体比较长
    - 包含递归调用
    - 包含动态派发
 
 */
//: [Next](@next)


