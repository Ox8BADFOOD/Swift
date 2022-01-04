//: [Previous](@previous)

import Foundation

/*:
 # 类属性(只能通过类型去访问)
 
 ## 分类
 - 存储类型属性
    - 整个程序运行过程中，就只有1份内存（swift_once -> dispatch_once）
    - 内存角度看本质就是全局变量
 - 计算类型属性
 
 ## 特点
 - 不同于存储实例属性，必须给存储类型设定初始值
    - 类型没有像实例那样的init初始化器来初始化存储属性
 - 存储类属性默认就是lazy
 - 就算被多个线程同时访问，保证只会初始化一次
 - 存储属性可以用let（因为没有像实例那样的init）
 - 枚举类型也可以定义类型属性
 */

public class FileManager {
    
    public static let shared = {
        return FileManager()
    }()
    private init(){}
}
//: [Next](@next)
