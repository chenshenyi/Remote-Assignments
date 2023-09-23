import UIKit

class IndexPage: UIViewController {
  let button1 = UIButton()
  let button3 = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    button1.setTitle("Assignment1", for: .normal)
    button1.setTitleColor(.text, for: .normal)
    button1.backgroundColor = .primary
    button1.translatesAutoresizingMaskIntoConstraints = false
    button1.addTarget(self,
                      action: #selector(pressButton1),
                      for: .touchUpInside)

    button3.setTitle("Assssignment3", for: .normal)
    button3.setTitleColor(.primary, for: .normal)
    button3.backgroundColor = .secondary
    button3.translatesAutoresizingMaskIntoConstraints = false
    button3.addTarget(self,
                      action: #selector(pressButton3),
                      for: .touchUpInside)

    view.addSubview(button1)
    view.addSubview(button3)
    view.backgroundColor = .background

    NSLayoutConstraint.activate([
      button1.heightAnchor.constraint(equalTo: button1.widthAnchor),
      button1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      button1.trailingAnchor.constraint(equalTo: view.centerXAnchor),
      button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      button3.heightAnchor.constraint(equalTo: button3.widthAnchor),
      button3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      button3.leadingAnchor.constraint(equalTo: view.centerXAnchor),
      button3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }

  // MARK: - Navigation
  @objc func pressButton1() {
    let vc = Assignment1()
    vc.title = "Assignment1"
    navigationController?.pushViewController(vc, animated: true)
  }

  @objc func pressButton3() {
    let vc = Assignment3()
    vc.title = "Assignment3"
    navigationController?.pushViewController(vc, animated: true)
  }
}
