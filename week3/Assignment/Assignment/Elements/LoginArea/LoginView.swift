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
      warningLabel.text = ""
      textFields["account"]?.text = ""
      textFields["password"]?.text = ""
      textFields["check"]?.text = ""

      labels["account"]?.loginFieldState = .normal
      labels["password"]?.loginFieldState = .normal
      textFields["account"]?.loginFieldState = .normal
      textFields["password"]?.loginFieldState = .normal

      if mode == .login {
        labels["check"]?.loginFieldState = .disabled
        textFields["check"]?.loginFieldState = .disabled
      } else {
        labels["check"]?.loginFieldState = .normal
        textFields["check"]?.loginFieldState = .normal
      }
    }
  }

  let fields = ["account", "password", "check"]
  var labels: [String: LoginLabel] = [:]
  var textFields: [String: LoginTextField] = [:]
  var warningLabel = UILabel()

  convenience init() {
    self.init(frame: .zero)
    clipsToBounds = false

    // MARK: UIViews
    let labelStackView = UIStackView()
    let textFieldStackView = UIStackView()
    let grayStackView = UIStackView(arrangedSubviews: [labelStackView, textFieldStackView])
    addSubview(warningLabel)
    addSubview(grayStackView)
    subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    // MARK: labelStackView
    labelStackView.axis = .vertical
    labelStackView.alignment = .fill
    labelStackView.distribution = .fillProportionally
    labelStackView.spacing = 5
    labelStackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    labelStackView.isLayoutMarginsRelativeArrangement = true

    // MARK: textFieldStackView
    textFieldStackView.axis = .vertical
    textFieldStackView.alignment = .fill
    textFieldStackView.distribution = .fillProportionally
    textFieldStackView.spacing = 5
    textFieldStackView.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    textFieldStackView.isLayoutMarginsRelativeArrangement = true

    // MARK: grayStackView
    grayStackView.axis = .horizontal
    grayStackView.alignment = .fill
    grayStackView.distribution = .fill
    grayStackView.spacing = 8
    grayStackView.backgroundColor = .lightGray
    grayStackView.insetsLayoutMarginsFromSafeArea = false
    
    // MARK: fields
    fields.forEach { field in
      labels[field] = LoginLabel(text: field)
      textFields[field] = LoginTextField()
      labelStackView.addArrangedSubview(labels[field]!)
      textFieldStackView.addArrangedSubview(textFields[field]!)
    }

    textFields["account"]!.autocapitalizationType = .none
    textFields["account"]!.autocorrectionType = .no
    textFields["password"]!.textContentType = .oneTimeCode
    textFields["password"]!.isSecureTextEntry = true
    textFields["check"]!.textContentType = .oneTimeCode
    textFields["check"]!.isSecureTextEntry = true
    
    labelStackView.arrangedSubviews.forEach { subview in
      subview.setContentCompressionResistancePriority(
        textFieldStackView.contentCompressionResistancePriority(for: .horizontal) + 1,
        for: .horizontal
      )
      subview.setContentHuggingPriority(
        textFieldStackView.contentHuggingPriority(for: .horizontal) + 1,
        for: .horizontal
      )
    }


    // MARK: warningLabel
    warningLabel.text = ""
    warningLabel.textColor = .red
    warningLabel.font = .systemFont(ofSize: 12)

    // MARK: - Constraints
    NSLayoutConstraint.activate([
      // MARK: grayStackView constraints
      grayStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      grayStackView.topAnchor.constraint(equalTo: topAnchor),
      grayStackView.leftAnchor.constraint(equalTo: leftAnchor),
      grayStackView.rightAnchor.constraint(equalTo: rightAnchor),

      // MARK: warningLabel constraints
      warningLabel.rightAnchor.constraint(equalTo: grayStackView.rightAnchor),
      warningLabel.bottomAnchor.constraint(equalTo: grayStackView.topAnchor, constant: -5),
    ])
  }

  func setDelegate(delegate: UITextFieldDelegate) {
    textFields.values.forEach { $0.delegate = delegate }
  }

  func isValid() -> Bool {
    guard isAccountValid() else { return false }

    guard isPasswordValid() else { return false }

    if mode == .signup {
      guard isPasswordMatched() else { return false }
    }

    warningLabel.isHidden = true
    return true
  }

  func isAccountValid() -> Bool {
    let accountLabel = labels["account"]!
    let accountTextField = textFields["account"]!
    let accountText = accountTextField.text!

    if accountText.isEmpty {
      warningLabel.isHidden = false
      warningLabel.text = "*Account is empty."

      accountTextField.loginFieldState = .error
      accountLabel.loginFieldState = .error
      return false
    }

    accountTextField.loginFieldState = .normal
    accountLabel.loginFieldState = .normal
    return true
  }

  func isPasswordValid() -> Bool {
    let passwordLabel = labels["password"]!
    let passwordTextField = textFields["password"]!
    let passwordText = passwordTextField.text!

    if passwordText.isEmpty {
      warningLabel.isHidden = false
      warningLabel.text = "*Password is empty."

      passwordLabel.loginFieldState = .error
      passwordTextField.loginFieldState = .error
      return false
    }

    passwordLabel.loginFieldState = .normal
    passwordTextField.loginFieldState = .normal
    return true
  }

  func isPasswordMatched() -> Bool {
    let passwordLabel = labels["password"]!
    let passwordTextField = textFields["password"]!
    let passwordText = passwordTextField.text!

    let checkLabel = labels["check"]!
    let checkTextField = textFields["check"]!
    let checkText = checkTextField.text!

    guard checkTextField.loginFieldState != .disabled else { return true }

    if passwordText != checkText {
      warningLabel.isHidden = false
      warningLabel.text = "*Password doesn't match."

      passwordLabel.loginFieldState = .error
      passwordTextField.loginFieldState = .error
      checkLabel.loginFieldState = .error
      checkTextField.loginFieldState = .error
      return false
    }

    passwordLabel.loginFieldState = .normal
    passwordTextField.loginFieldState = .normal
    checkLabel.loginFieldState = .normal
    checkTextField.loginFieldState = .normal
    return true
  }

  func getAccountData() -> AccountData? {
    guard isValid() else { return nil }

    let accountTextField = textFields["account"]!
    let accountText = accountTextField.text!
    let passwordTextField = textFields["password"]!
    let passwordText = passwordTextField.text!

    return AccountData(account: accountText, password: passwordText)
  }
}
