import UIKit

class Assignment1Cell: UITableViewCell {
  static let reuseIdentifier = String(describing: Assignment1Cell.self)

  let label = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .primary
    contentView.addSubview(label)

    label.font = UIFont(name: "PingFang TC", size: 20)
    label.textColor = .text
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      label.leftAnchor.constraint(equalToSystemSpacingAfter: contentView.leftAnchor,
                                  multiplier: 3),
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    contentView.backgroundColor = selected
      ? .accent
      : .primary
  }
}
