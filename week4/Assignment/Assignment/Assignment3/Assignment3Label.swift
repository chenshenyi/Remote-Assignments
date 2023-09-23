import UIKit

class Assignment3Label: UILabel {
  convenience init(fontSize: CGFloat) {
    self.init()
    font = UIFont(name: "PingFang TC", size: fontSize)
    text = ""
    textColor = .text
    textAlignment = .center
    translatesAutoresizingMaskIntoConstraints = false
  }
}
