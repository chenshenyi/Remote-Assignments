//
//  LoginView.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

class LoginView: UIView {
  var mode: LoginMode = .login {
    didSet {
      grayStackView.mode = mode
      warningLabel.text = ""
    }
  }

  var warningLabel = UILabel()
  var grayStackView = GrayStackView()

  convenience init() {
    self.init(frame: .zero)
    clipsToBounds = false
    addSubview(warningLabel)
    addSubview(grayStackView)

    grayStackView.translatesAutoresizingMaskIntoConstraints = false
    grayStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    grayStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    grayStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    grayStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

    warningLabel.text = ""
    warningLabel.textColor = .red
    warningLabel.font = .systemFont(ofSize: 12)
    warningLabel.translatesAutoresizingMaskIntoConstraints = false
    warningLabel.rightAnchor.constraint(equalTo: grayStackView.rightAnchor).isActive = true
    warningLabel.bottomAnchor.constraint(equalTo: grayStackView.topAnchor,
                                         constant: -5).isActive = true
  }

  func setDelegate(delegate: UIViewController) {
    guard let textFieldDelegate = delegate as? UITextFieldDelegate else {
      return
    }

    grayStackView.textFieldStackView.arrangedSubviews.forEach { textField in
      let textField = textField as? UITextField
      textField?.delegate = textFieldDelegate
    }
  }

  func isValid() -> Bool {
    guard isAccountValid() else { return false }

    if mode == .signup {
      guard isPasswordMatched() else { return false }
    }

    warningLabel.isHidden = true
    return true
  }

  func isAccountValid() -> Bool {
    let accountLabel = grayStackView.labelStackView.accountLabel
    let accountTextField = grayStackView.textFieldStackView.accountTextField
    let accountText = accountTextField.text!

    if accountText.isEmpty {
      warningLabel.isHidden = false
      warningLabel.text = "*Account is empty."

      accountTextField.loginState = .error
      accountLabel.loginState = .error
      return false
    }

    accountTextField.loginState = .normal
    accountLabel.loginState = .normal
    return true
  }

  func isPasswordMatched() -> Bool {
    let passwordLabel = grayStackView.labelStackView.passwordLabel
    let passwordTextField = grayStackView.textFieldStackView.passwordTextField
    let passwordText = passwordTextField.text!

    let checkLabel = grayStackView.labelStackView.checkLabel
    let checkTextField = grayStackView.textFieldStackView.checkTextField
    let checkText = checkTextField.text!

    guard checkTextField.loginState != .disabled else { return true }

    if passwordText != checkText {
      warningLabel.isHidden = false
      warningLabel.text = "*Password doesn't match."

      passwordLabel.loginState = .error
      passwordTextField.loginState = .error
      checkLabel.loginState = .error
      checkTextField.loginState = .error
      return false
    }

    passwordLabel.loginState = .normal
    passwordTextField.loginState = .normal
    checkLabel.loginState = .normal
    checkTextField.loginState = .normal
    return true
  }

  func getAccountData() -> AccountData? {
    guard isValid() else { return nil }

    let accountTextField = grayStackView.textFieldStackView.accountTextField
    let accountText = accountTextField.text!
    let passwordTextField = grayStackView.textFieldStackView.passwordTextField
    let passwordText = passwordTextField.text!

    return AccountData(account: accountText, password: passwordText)
  }
}
