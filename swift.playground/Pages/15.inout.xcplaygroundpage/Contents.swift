//: [Previous](@previous)

import Foundation

struct Rectangle{
    var width = 100
    var high = 101{
        willSet{
            print("newValue:\(newValue)")
        }
        didSet {
            print("oldValue:\(oldValue)")
        }
    }
    var area: Int{
        set{
            high = newValue / width
        }
        get{
            return width * high
        }
    }
    
    func describe(){
        print("width:\(width),high:\(high),area:\(area)")
    }
}

func changeValue(value :inout Int){
    value = 10
}

var rg = Rectangle()

/*:
#### 如果实参有物理内存地址，且没有设置属性观察器;直接将实参的内存地址传入函数（实参进行引用传递）
 */

//changeValue(value: &rg.width)
//rg.describe()

/*:
如果实参是计算属性、设置了属性观察器
- 本质是copyIn和copyOut;
    - 调用函数时，先复制实参的值，产生副本get
    - 将副本的内存地址传入函数（副本进行引用传递）
    - 函数内部修改副本的值
    - 函数返回后，再将副本的值覆盖实参的值set
 */

changeValue(value: &rg.high)
rg.describe()

/*
#### 修改计算属性
 - 调用get方法，把get方法的返回值拷贝到到局部变量（这一步跟计算属性的值调用inout不同）
 - 将副本的内存地址传入函数（副本进行引用传递）
 - 函数内部修改副本的值
 - 函数返回后，调用set方法,副本的值就是newValue
 */

//changeValue(value: &rg.high)

//: [Next](@next)
