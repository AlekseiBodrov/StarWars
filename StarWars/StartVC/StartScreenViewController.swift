import UIKit

final class StartScreenViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var startViewForLabel: UIView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var backgoundImageView: UIImageView!
    @IBOutlet weak var loadingView: UIView!
    private var isLoadingView = true
    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet weak var contanerForButtons: UIView!

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
    func configure() {
        view.backgroundColor = .black
        contanerForButtons.backgroundColor = .black

        backgoundImageView.image = UIImage(named: "LaunchScreen")
        backgoundImageView.frame = view.bounds
        backgoundImageView.contentMode = .scaleAspectFill
        backgoundImageView.clipsToBounds = true

        loadingView.rounded(radius: loadingView.frame.size.height / 2)
        loadingView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        loadingView.layer.borderWidth = 2

        startViewForLabel.rounded(radius: startViewForLabel.frame.size.height / 2)

        startLabel.text = "START"
        startLabel.textColor = .black
        startLabel.sizeToFit()
        startLabel.textAlignment = .center

        settingImageView.image = UIImage(systemName: "gearshape.fill")
        settingImageView.tintColor = .white
        settingImageView.isUserInteractionEnabled = true
        winnerImageView.image = UIImage(named: "cup")
        winnerImageView.image?.withTintColor(.white)
        winnerImageView.isUserInteractionEnabled = true

        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(settingImagePressed))
        settingImageView.addGestureRecognizer(recognizer1)
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(winnerImagePressed))
        winnerImageView.addGestureRecognizer(recognizer2)

//        startImageView.image = UIImage(named: "startImage")
//        startImageView.backgroundColor = .white
//        startImageView.layer.cornerRadius = startImageView.frame.size.height / 2
//        startImageView.contentMode = .scaleAspectFill
//
//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
//        startImageView.addGestureRecognizer(recognizer)
    }
    @objc func settingImagePressed() {
        UIView.animate(withDuration: 0.2) {
            self.settingImageView.transform = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
        } completion: { _ in
            self.settingImageView.transform = .identity
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else { return }
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    @objc func winnerImagePressed() {
        UIView.animate(withDuration: 0.2) {
            self.winnerImageView.transform = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
        } completion: { _ in
            self.winnerImageView.transform = .identity
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "WinnerListViewController") as? WinnerListViewController else { return }
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

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
