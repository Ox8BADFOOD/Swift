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
 # let
 - 只能赋值一次
 - 他的值**不要求在编译期确定**，但使用之前必须赋值一次
 */
    let vc : UITableViewController

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

//: [Next](@next)
