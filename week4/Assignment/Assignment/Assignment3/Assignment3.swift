import UIKit

class Assignment3: UIViewController {
  let idLabel = Assignment3Label(fontSize: 30)
  let nameLabel = Assignment3Label(fontSize: 80)
  let addressLabel = Assignment3Label(fontSize: 18)
  let url = URL(string: "https://remote-assignment.s3.ap-northeast-1.amazonaws.com/station")!
  var station: Station? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .background

    let labels = [idLabel, nameLabel, addressLabel]
    labels.forEach { view.addSubview($0) }
    NSLayoutConstraint.activate(
      labels.map {
        $0.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      } + [
        idLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,
                                        constant: -35),
        nameLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor,
                                          constant: -100),
        addressLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                             constant: -200),
      ]
    )

    updateStation()
  }

  func updateStation() {
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: url) { data, response, error in
      guard let response = response as? HTTPURLResponse,
            response.statusCode == 200 else { return }
      guard let data else {
        print(error.debugDescription)
        return
      }

      do {
        let decoder = JSONDecoder()
        self.station = try decoder.decode(Station.self, from: data)

        let queue = OperationQueue.main
        queue.addOperation {
          self.updateLabels()
        }
      } catch {
        print("Error info: \(error)")
      }
    }

    task.resume()
  }

  func updateLabels() {
    guard let station else { return }
    idLabel.text = station.stationID
    nameLabel.text = station.stationName
    addressLabel.text = station.stationAddress
  }
}
