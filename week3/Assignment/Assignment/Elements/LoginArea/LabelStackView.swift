//
//  LabelStackView.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

class LabelStackView: UIStackView {
  let accountLabel = LoginLabel(text: "Account")
  let passwordLabel = LoginLabel(text: "Password")
  let checkLabel = LoginLabel(text: "Check")

  var mode: LoginMode = .login {
    didSet {
      accountLabel.loginState = .normal
      passwordLabel.loginState = .normal
      if mode == .login {
        checkLabel.loginState = .disabled
      } else {
        checkLabel.loginState = .normal
      }
    }
  }

  convenience init() {
    self.init(frame: .zero)
    addArrangedSubview(accountLabel)
    addArrangedSubview(passwordLabel)
    addArrangedSubview(checkLabel)

    axis = .vertical
    alignment = .fill
    distribution = .fillProportionally
    spacing = 5
    layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    isLayoutMarginsRelativeArrangement = true
  }
}
