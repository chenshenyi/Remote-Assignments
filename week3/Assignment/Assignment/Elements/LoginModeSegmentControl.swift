//
//  LoginModeSegmentControl.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

class LoginModeSegmentControl: UISegmentedControl {
  convenience init() {
    self.init(items: ["Log in", "Sign up"])

    layer.borderWidth = 1

    backgroundColor = .white
    selectedSegmentTintColor = .clear
    setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
    setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 4
    subviews[0 ..< numberOfSegments].forEach { $0.backgroundColor = backgroundColor }
    subviews[selectedSegmentIndex].backgroundColor = .black
  }
}
