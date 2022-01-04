//: [Previous](@previous)

import Foundation


struct SayHi{
/*:
## 存储属性
- 类似于成员变量的概念
- 存储在实力变量内存中
- 结构体和类可以定义存储属性
- 枚举不可以定义存储属性（枚举的内存只有原始值和关联值）
- 创建类和结构体时，必须为所有的存储属性设置一个合适的初始值
*/
    var value :String = ""
    
/*:
## 延迟存储属性
- 使用lazy定义一个延迟存储属性，在第一次用到的时候才会初始化
- lazy必须是var,不能是let
    - let必须在实例初始化方法完成之前就拥有值
- 如果多条线程同时第一次访问lazy属性，无法保证属性只被初始化一次
 */
    lazy var name :String = "joke"
    
    
/*:
## 属性监听器
- set -> willSet -> didSet
- 在初始化器中设置属性值不会触发属性监听器
- 在属性定义时设置属性值不会触发属性监听器
 */
    var hello :String = "hello"{
        willSet{
            print("newValue:\(newValue)")
        }
        didSet {
            print("oldValue:\(oldValue)")
        }
    }
    
/*:
## 计算属性
 - 本质是方法
 - 不占用实例的内存
 - 枚举、结构体、类都可以定义计算属性
    - 枚举rawValue的本质就是计算属性
 - 定义计算属性只能用var不能用let
 */
    var greeting: String{
        set{
            print(newValue)
        }
        get{
            return "Hello, playground"
        }
    }
}

var hi = SayHi()

hi.hello = "greeting"

hi.greeting
hi.greeting = "greeting"
//: [Next](@next)
