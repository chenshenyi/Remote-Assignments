//
//  TextFields.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/11.
//

import UIKit

/// 會根據 LoginFieldState 來調整顏色和字體
class LoginTextField: UITextField {
  var loginFieldState: LoginFieldState = .normal {
    didSet {
      switch loginFieldState {
      case .normal:
        self.isEnabled = true
        self.backgroundColor = .white
        self.layer.borderWidth = 0
      case .error:
        self.isEnabled = true
        self.layer.borderColor = UIColor.red.cgColor
        self.backgroundColor = .white
        self.layer.borderWidth = 2
      case .disabled:
        self.isEnabled = false
        self.layer.borderWidth = 0
        self.backgroundColor = .gray
      }
    }
  }

  convenience init() {
    self.init(frame: .zero)
    borderStyle = .roundedRect
    backgroundColor = .white
  }
}
