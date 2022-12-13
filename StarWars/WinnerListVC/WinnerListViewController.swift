import UIKit

final class WinnerListViewController: UIViewController {
    //MARK: - var\let
    private let winnerList = WinnerListModel()
    private lazy var arrayWinners = winnerList.fetchArrayFromSet()

    //MARK: - IBOutlets
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winnerListTableView: UITableView!

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        view.backgroundColor = .white

        winnerLabel.confugure(with: "Winners!", size: 40)

        winnerListTableView.layer.borderColor = UIColor.black.cgColor
        winnerListTableView.layer.borderWidth = 1
        winnerListTableView.layer.cornerRadius = 10

        picker.layer.borderColor = UIColor.black.cgColor
        picker.layer.borderWidth = 1
        picker.layer.cornerRadius = 10
        picker.delegate = self
    }
}

extension WinnerListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayWinners.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return arrayWinners[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        arrayUsers = Game.users
//        if row != 0 {
//            arrayUsers = arrayUsers.filter({ $0.userName == arrayNames[row] })
//        }
//        arrayUsers.sort{ $0.scoreLable > $1.scoreLable }
//        winnerTableView.reloadData()
    }
}
