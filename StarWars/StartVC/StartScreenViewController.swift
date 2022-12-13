import UIKit

final class StartScreenViewController: UIViewController {

    //MARK: - var\let
    private var isLoadingView = true

    //MARK: - IBOutlets
    @IBOutlet weak var backgoundImageView: UIImageView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var contanerForButtons: UIView!

    @IBOutlet weak var winnersButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!


    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateLoadingView()
    }

    //MARK: - flow funcs
    private func configure() {
        view.backgroundColor = .black
        contanerForButtons.backgroundColor = .black
//        buttom.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
//        buttom.contentMode = .scaleToFill
        backgoundImageView.image = UIImage(named: "LaunchScreen")
        backgoundImageView.frame = view.bounds
        backgoundImageView.contentMode = .scaleAspectFill
        backgoundImageView.clipsToBounds = true

        loadingView.rounded(radius: loadingView.frame.size.height / 2)
        loadingView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        loadingView.layer.borderWidth = 2

//        startViewForLabel.rounded(radius: startViewForLabel.frame.size.height / 2)
//
//        startLabel.text = "START"
//        startLabel.textColor = .black
//        startLabel.sizeToFit()
//        startLabel.textAlignment = .center
//
//        settingImageView.image = UIImage(systemName: "gearshape.fill")
//        settingImageView.tintColor = .white
//        settingImageView.isUserInteractionEnabled = true
        winnersButton.setTitleColor(UIColor.white, for: .normal)
        winnersButton.setTitle("", for: .normal)

        winnersButton.setImage(UIImage(named: "cup"), for: .normal)

        settingButton.setTitle("", for: .normal)
        settingButton.tintColor = .white
        
        settingButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
//        winnersButton.image?.withTintColor(.white)
//        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(settingImagePressed))
//        settingImageView.addGestureRecognizer(recognizer1)
//        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(winnerImagePressed))
//        winnerImageView.addGestureRecognizer(recognizer2)

//        startImageView.image = UIImage(named: "startImage")
//        startImageView.backgroundColor = .white
//        startImageView.layer.cornerRadius = startImageView.frame.size.height / 2
//        startImageView.contentMode = .scaleAspectFill
//
//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
//        startImageView.addGestureRecognizer(recognizer)
    }
//    @objc func settingImagePressed() {
//        UIView.animate(withDuration: 0.2) {
//            self.settingImageView.transform = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
//        } completion: { _ in
//            self.settingImageView.transform = .identity
//            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
//    }
//
//    @objc func winnerImagePressed() {
//        UIView.animate(withDuration: 0.2) {
//            self.winnerImageView.transform = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
//        } completion: { _ in
//            self.winnerImageView.transform = .identity
//            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "WinnerListViewController") as? WinnerListViewController else { return }
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
//    }

    @objc func tapDetected() {
//
//        UIView.animate(withDuration: 0.2) {
//            self.startImageView.transform = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
//        } completion: { _ in
//            self.startImageView.transform = .identity
//            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "PlayerChoiceViewController") as? PlayerChoiceViewController else { return }
//            self.navigationController?.pushViewController(controller, animated: false)
//        }
    }

    func animateLoadingView(){
        guard isLoadingView else { return }
        loadingView.frame.size.width = 0
        UIView.animate(withDuration: 5) { [self] in
            loadingView.frame.size.width = contanerForButtons.frame.size.width
        } completion: { [self] _ in
            loadingView.removeFromSuperview()
            backgoundImageView.removeFromSuperview()
            isLoadingView = false
        }
    }
}
