import UIKit

class Assignment1: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(Assignment1Cell.self,
                       forCellReuseIdentifier: Assignment1Cell.reuseIdentifier)
    tableView.backgroundColor = .background
    tableView.rowHeight = 100
    tableView.reloadData()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int
  {
    (section == 0)
      ? 10
      : 5
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
  UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Assignment1Cell.reuseIdentifier,
                                             for: indexPath) as! Assignment1Cell
    cell.label.text = "This is section \(indexPath.section), row \(indexPath.row)"
    return cell
  }
}
