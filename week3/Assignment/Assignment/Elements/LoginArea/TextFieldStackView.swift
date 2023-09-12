//
//  TextFieldStackView.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

class TextFieldStackView: UIStackView {
  let accountTextField = LoginTextField()
  let passwordTextField = LoginTextField()
  let checkTextField = LoginTextField()

  var mode: LoginMode = .login {
    didSet {
      accountTextField.text = ""
      passwordTextField.text = ""
      checkTextField.text = ""
      accountTextField.loginState = .normal
      passwordTextField.loginState = .normal
      if mode == .login {
        checkTextField.loginState = .disabled
      } else {
        checkTextField.loginState = .normal
      }
    }
  }

  convenience init() {
    self.init(frame: .zero)
    addArrangedSubview(accountTextField)
    addArrangedSubview(passwordTextField)
    addArrangedSubview(checkTextField)
    accountTextField.autocapitalizationType = .none
    accountTextField.autocorrectionType = .no
    passwordTextField.textContentType = .oneTimeCode
    passwordTextField.isSecureTextEntry = true
    checkTextField.textContentType = .oneTimeCode
    checkTextField.isSecureTextEntry = true

    axis = .vertical
    alignment = .fill
    distribution = .fillProportionally
    spacing = 5
    layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    isLayoutMarginsRelativeArrangement = true
  }
}
