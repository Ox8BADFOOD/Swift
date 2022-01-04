//: [Previous](@previous)

import Foundation

/*
 使用subscript可以给任意类型（枚举，结构体，类）增加下标功能，
 subscript的语法类似于实例方法、计算属性，本质就是方法
 subscript可以没有set方法，但是必须要有get方法
 */
class Point{
    var x = 0.0
    var y = 0.0
    
    subscript(index: Int) -> Double{
        set{
            if index == 0{
                x = newValue
            } else if index == 1{
                y = newValue
            }
        }
        
        get{
            if index == 0{
                return x
            }else if index == 1{
                return y
            }
            return 0
        }
    }
}

var p = Point()
p[0] = 11.1
p[1] = 22.2
print(p.x) // 11.1
print(p.y) // 22.2
print(p[0])// 11.1
print(p[1])// 22.2


/*
 下标可以是类型方法
 */

class Sum{
    static subscript(v1: Int, v2:Int) -> Int{
        return v1 + v2
    }
}

print(Sum[10,20])

/*
接受多个参数的下标
 */

class Grid{
    var data = [
        [0,1,2],
        [3,4,5],
        [6,7,8]
    ]
    
    subscript(row: Int, column : Int) -> Int{
        set{
            guard row >= 0 && row < 3 && column >= 0 && column < 3 else{
                return
            }
            data[row][column] = newValue
        }
        
        get{
            guard row >= 0 && row < 3 && column >= 0 && column < 3 else{
                return 0
            }
            return data[row][column]
        }
    }
}

var grid = Grid()
grid[0,1] = 77
grid[1,2] = 88
grid[2,0] = 99
print(grid.data)
//: [Next](@next)
