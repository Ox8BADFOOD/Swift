import UIKit
import PlaygroundSupport

let vc = UITableViewController()
let header = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
header.backgroundColor = .green
vc.tableView.tableHeaderView = header
PlaygroundPage.current.liveView = vc



