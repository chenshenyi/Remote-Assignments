//
//  LoginLabel.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

/// 會根據 LoginFieldState 來調整顏色和字體
class LoginLabel: UILabel {
  var loginFieldState: LoginFieldState = .normal {
    didSet {
      switch loginFieldState {
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
