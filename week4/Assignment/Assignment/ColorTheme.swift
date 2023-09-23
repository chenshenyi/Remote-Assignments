import UIKit

// https://realtimecolors.com/?colors=fbfaf9-b3843d-324157-99ff9b-546d92
extension UIColor {
  convenience init(rgb: Int, a: Float = 1.0) {
    self.init(
      red: hex2CGFloat(x: rgb, shift: 16),
      green: hex2CGFloat(x: rgb, shift: 8),
      blue: hex2CGFloat(x: rgb),
      alpha: CGFloat(a)
    )
  }

  convenience init(rgba: Int) {
    self.init(
      red: hex2CGFloat(x: rgba, shift: 24),
      green: hex2CGFloat(x: rgba, shift: 16),
      blue: hex2CGFloat(x: rgba, shift: 8),
      alpha: hex2CGFloat(x: rgba)
    )
  }

  static let text = UIColor(rgb: 0xFBFAF9)
  static let background = UIColor(rgb: 0xB3843D)
  static let primary = UIColor(rgb: 0x324157)
  static let secondary = UIColor(rgb: 0x99FF9B)
  static let accent = UIColor(rgb: 0x546D92)
}

func hex2CGFloat(x: Int, shift n: Int = 0) -> CGFloat {
  CGFloat((x >> n) & 0xFF) / CGFloat(255)
}
