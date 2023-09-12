//
//  TextFields.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/11.
//

import UIKit

class LoginTextField: UITextField {
  enum LoginState {
    case normal
    case error
    case disabled
  }

  var loginState: LoginState = .normal {
    didSet {
      switch loginState {
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
