//: [Previous](@previous)

import Foundation

//: # 协议中的关联类型associatedtype

//: 在协议中除了定义属性和方法外，我们还能定义类型的占位符，让实现协议的类型来指定具体的类型。
protocol Food { }

protocol Animal {
    associatedtype F: Food
    func eat(_ food: F)
}

struct Meat: Food { }
struct Grass: Food { }

struct Tiger: Animal {
    func eat(_ food: Meat) {
        print("eat \(food)")
    }
}

struct Sheep: Animal {
    func eat(_ food: Grass) {
        print("eat \(food)")
    }
}

Tiger().eat(Meat())
Sheep().eat(Grass())

/*:
 > 添加 associatedtype 后，Animal 协议就不能被当作独立的类型使用了。因为 Animal 包含了一个不确定的类型，所以随着 Animal 本身类型的变化，其中的 F 将无法确定。在一个协议加入了像是 associatedtype 或者 Self 的约束后，它将只能被用为泛型约束，而不能作为独立类型的占位使用。我们需要将函数改写为泛型：
 */

func isTiger<T: Animal>(animal: T) -> Bool {
    if animal is Tiger {
        return true
    } else {
        return false
    }
}

//true
isTiger(animal: Tiger())
//false
isTiger(animal: Sheep())
//: [Next](@next)
