import UIKit

class NavigationViewController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationBar.tintColor = .text
    let textAttributes = [NSAttributedString.Key.foregroundColor:
      UIColor.text]
    navigationBar.titleTextAttributes = textAttributes
  }
}
