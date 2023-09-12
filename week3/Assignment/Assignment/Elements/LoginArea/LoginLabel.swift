//
//  LoginLabel.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

class LoginLabel: UILabel {
  enum LoginState {
    case normal
    case error
    case disabled
  }

  var loginState: LoginState = .normal {
    didSet {
      switch loginState {
      case .normal:
        textColor = .black
        font = .systemFont(ofSize: self.font.pointSize)
      case .error:
        textColor = .red
        font = .boldSystemFont(ofSize: self.font.pointSize)
      case .disabled:
        textColor = .gray
        font = .systemFont(ofSize: self.font.pointSize)
      }
    }
  }

  convenience init(text: String) {
    self.init(frame: .zero)
    self.text = text
    sizeToFit()
  }
}
