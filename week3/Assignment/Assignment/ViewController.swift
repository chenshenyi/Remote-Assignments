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

    // MARK: appWorksSchoolLable
    appWorksSchoolLable.text = "AppWorks School"
    appWorksSchoolLable.font = .systemFont(ofSize: 40)
    appWorksSchoolLable.sizeToFit()
    view.addSubview(appWorksSchoolLable)

    // MARK: segmentControl
    mode = .login
    segmentControl.selectedSegmentIndex = 0
    segmentControl.addTarget(self,
                             action: #selector(modeChanged),
                             for: .valueChanged)
    view.addSubview(segmentControl)

    // MARK: loginView
    loginView.setDelegate(delegate: self)
    view.addSubview(loginView)

    // MARK: button
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .black
    button.addTarget(self,
                     action: #selector(buttonClicked),
                     for: .touchUpInside)
    view.addSubview(button)

    // MARK: - appWorksSchoolLable Constraints
    appWorksSchoolLable.translatesAutoresizingMaskIntoConstraints = false
    appWorksSchoolLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    appWorksSchoolLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: 80).isActive = true
    // MARK: segmentControl Constraints
    segmentControl.translatesAutoresizingMaskIntoConstraints = false
    segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    segmentControl.topAnchor.constraint(equalTo: appWorksSchoolLable.bottomAnchor,
                                        constant: 70).isActive = true
    segmentControl.widthAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true

    // MARK: loginView Constraints
    loginView.translatesAutoresizingMaskIntoConstraints = false
    loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loginView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor,
                                   constant: 40).isActive = true
    loginView.heightAnchor.constraint(equalToConstant: 125).isActive = true
    loginView.widthAnchor.constraint(equalToConstant: 255).isActive = true

    // MARK: button Constraints
    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 50).isActive = true
    button.widthAnchor.constraint(equalToConstant: 235).isActive = true
    button.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
