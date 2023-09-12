//
//  ViewController.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/11.
//

import UIKit

class ViewController: UIViewController {
  var mode: LoginMode = .login {
    didSet {
      loginView.mode = mode
      button.setTitle(mode.rawValue, for: .normal)
    }
  }

  var savedAccountDatas = [
    "appworks_school": AccountData(
      account: "appworks_school",
      password: "1234"),
  ]

  let appWorksSchoolLable = UILabel()
  let loginView = LoginView()
  let segmentControl = LoginModeSegmentControl()
  let button = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(appWorksSchoolLable)
    view.addSubview(segmentControl)
    view.addSubview(loginView)
    view.addSubview(button)

    // MARK: appWorksSchoolLable
    appWorksSchoolLable.text = "AppWorks School"
    appWorksSchoolLable.font = .systemFont(ofSize: 40)
    appWorksSchoolLable.sizeToFit()

    // MARK: segmentControl
    mode = .login
    segmentControl.selectedSegmentIndex = 0
    segmentControl.addTarget(self,
                             action: #selector(modeChanged),
                             for: .valueChanged)

    // MARK: loginView
    loginView.setDelegate(delegate: self)

    // MARK: button
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .black
    button.addTarget(self,
                     action: #selector(buttonClicked),
                     for: .touchUpInside)

    // MARK: - Constraints
    view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    NSLayoutConstraint.activate([
      // MARK: appWorksSchoolLable Constraints
      appWorksSchoolLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      appWorksSchoolLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: 80),

      // MARK: segmentControl Constraints
      segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      segmentControl.topAnchor.constraint(equalTo: appWorksSchoolLable.bottomAnchor,
                                          constant: 70),
      segmentControl.widthAnchor.constraint(greaterThanOrEqualToConstant: 150),

      // MARK: loginView Constraints
      loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loginView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor,
                                     constant: 40),
      loginView.heightAnchor.constraint(equalToConstant: 125),
      loginView.widthAnchor.constraint(equalToConstant: 255),

      // MARK: button Constraints
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 50),
      button.widthAnchor.constraint(equalToConstant: 235),
      button.heightAnchor.constraint(equalToConstant: 30),
    ])
  }

  @objc func modeChanged() {
    switch segmentControl.selectedSegmentIndex {
    case 0: mode = .login
    case 1: mode = .signup
    default: break
    }
  }

  @objc func buttonClicked() {
    guard loginView.isValid() else { return }
    guard let accountData = loginView.getAccountData() else { return }
    switch mode {
    case .login: loginFlow(accountData: accountData)
    case .signup: signupFlow(accountData: accountData)
    }
  }

  func loginFlow(accountData: AccountData) {
    guard savedAccountDatas.keys.contains(accountData.account) else {
      errorAlert(message: "No Such Account!")
      return
    }

    guard savedAccountDatas[accountData.account]!.password == accountData.password else {
      errorAlert(message: "Wrong Password!")
      return
    }

    successAlert(message: "Login Success!")
  }

  func signupFlow(accountData: AccountData) {
    guard !savedAccountDatas.keys.contains(accountData.account) else {
      errorAlert(message: "Account Already Exists!")
      return
    }

    savedAccountDatas[accountData.account] = accountData
    successAlert(message: "Signup Success!")
  }

  func errorAlert(message: String) {
    let alert = UIAlertController(
      title: "Error",
      message: message,
      preferredStyle: .alert
    )
    let alertAction = UIAlertAction(
      title: "OK",
      style: .default,
      handler: nil
    )
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
  }

  func successAlert(message: String) {
    let alert = UIAlertController(
      title: "Success",
      message: message,
      preferredStyle: .alert
    )
    let alertAction = UIAlertAction(
      title: "OK",
      style: .default,
      handler: nil
    )
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    let _ = loginView.isValid()
    return true
  }
}
