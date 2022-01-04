import UIKit
import PlaygroundSupport

//: [Previous](@previous)

/*:
 # markup语法
 - 跟markdown极度相似
 - 只在playground生效
 - 还有特殊语法糖
 
- //: [Previous](@previous)
- //: [Next](@next)
 
 
 */

/*:
 # playground
 目前为止playground好像还不支持断点调试？
 playground不光可以快速运行
*/
    vc = UITableViewController()
    let header = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
    header.backgroundColor = .red
    vc.tableView.tableHeaderView = header
//: 还能预览界面
    PlaygroundPage.current.liveView = vc

/*:
 # let
 - 只能赋值一次
 - 他的值**不要求在编译期确定**，但使用之前必须赋值一次
 - 实例属性，要求在实例初始化之前所有let属性都有值
 */
    let vc : UITableViewController

/*:
 # lazy
 - lazy 可以等一会再赋值
 - lazy和let作为实例属性的时候冲突
 - lazy和let作为类实例属性的时候可以共存，因为类实例属性不存在实例初始化
 */
//: [Next](@next)
