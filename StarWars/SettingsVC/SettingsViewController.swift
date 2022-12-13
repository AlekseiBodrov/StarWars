import UIKit

final class SettingsViewController: UIViewController {

    //MARK: - var\let
    private let settings = Settings()

    //MARK: - IBOutlets

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    @IBOutlet weak var charactersLeftArrowImageView: UIImageView!
    @IBOutlet weak var charactersRightArrowImageView: UIImageView!
    @IBOutlet weak var charactersImageView: UIImageView!

    
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var difficultyLeftArrowImageView: UIImageView!
    @IBOutlet weak var difficultyImageView: UIImageView!
    @IBOutlet weak var difficultyRightArrowImageView: UIImageView!


    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureGestureRecognizers()
        setImages()
    }

    //MARK: - flow funcs

    private func configure() {
        view.backgroundColor = .black
        settingsLabel.confugure(with: "Setting", size: 40)
        charactersLabel.confugure(with: "Side", size: 30)
        difficultyLabel.confugure(with: "Speed", size: 30)

        userNameLabel.confugure(with: "", size: 30)
        userNameLabel.text = settings.name

        userNameTextField.delegate = self
    }

    private func setImages() {
        difficultyImageView.configureImage(name: settings.arraySpeedGame[settings.currentSpeed],
                                           isSystemName: true)
        charactersImageView.configureImage(name: settings.arrayCharacters[settings.currentCharacter],
                                           isSystemName: false)

        charactersLeftArrowImageView.configureImage(name: "arrowtriangle.left.fill", isSystemName: true)
        charactersRightArrowImageView.configureImage(name: "arrowtriangle.right.fill",isSystemName: true)

        difficultyLeftArrowImageView.configureImage(name: "arrowtriangle.left.fill",isSystemName: true)
        difficultyRightArrowImageView.configureImage(name: "arrowtriangle.right.fill",isSystemName: true)
    }

    private func configureGestureRecognizers(){
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected))
        view.addGestureRecognizer(recognizer)

        let charactersLeftRecognizer = UITapGestureRecognizer(target: self, action: #selector(charactersLeftTapDetected))
        charactersLeftArrowImageView.addGestureRecognizer(charactersLeftRecognizer)
        let charactersRightRecognizer = UITapGestureRecognizer(target: self, action: #selector(charactersRightTapDetected))
        charactersRightArrowImageView.addGestureRecognizer(charactersRightRecognizer)

        let difficultyLeftRecognizer = UITapGestureRecognizer(target: self, action: #selector(difficultyLeftTapDetected))
        difficultyLeftArrowImageView.addGestureRecognizer(difficultyLeftRecognizer)
        let difficultyRightRecognizer = UITapGestureRecognizer(target: self, action: #selector(difficultyRightTapDetected))
        difficultyRightArrowImageView.addGestureRecognizer(difficultyRightRecognizer)
    }

    @objc func swipeDetected(){
        self.navigationController?.popViewController(animated: true)
    }

    @objc func charactersLeftTapDetected(){
        UIView.animate(withDuration: 0.1) {
            self.charactersLeftArrowImageView.transform = CGAffineTransform.init(scaleX: 0.98, y: 0.98)
        } completion: { [self] _ in
            self.charactersLeftArrowImageView.transform = .identity
            settings.decrementValue(setting: .character)
            charactersImageView.configureImage(name: settings.arrayCharacters[settings.currentCharacter],
                                               isSystemName: false )
        }
    }
    @objc func charactersRightTapDetected(){
        UIView.animate(withDuration: 0.1) {
            self.charactersRightArrowImageView.transform = CGAffineTransform.init(scaleX: 0.98, y: 0.98)
        } completion: { [self] _ in
            self.charactersRightArrowImageView.transform = .identity
            settings.incrementValue(setting: .character)
            charactersImageView.configureImage(name: settings.arrayCharacters[settings.currentCharacter],
                                               isSystemName: false )
        }
    }

    @objc func difficultyLeftTapDetected(){
        UIView.animate(withDuration: 0.1) {
            self.difficultyLeftArrowImageView.transform = CGAffineTransform.init(scaleX: 0.98, y: 0.98)
        } completion: { [self] _ in
            self.difficultyLeftArrowImageView.transform = .identity
            settings.decrementValue(setting: .speed)
            difficultyImageView.configureImage(name: settings.arraySpeedGame[settings.currentSpeed],
                                               isSystemName: true )
        }
    }

    @objc func difficultyRightTapDetected(){
        UIView.animate(withDuration: 0.1) {
            self.difficultyRightArrowImageView.transform = CGAffineTransform.init(scaleX: 0.98, y: 0.98)
        } completion: { [self] _ in
            self.difficultyRightArrowImageView.transform = .identity
            settings.incrementValue(setting: .speed)
            difficultyImageView.configureImage(name: settings.arraySpeedGame[settings.currentSpeed],
                                               isSystemName: true )
        }
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameLabel.text = textField.text
        hideKeyboard()
        return true
    }
    
    func hideKeyboard() {
        userNameTextField.resignFirstResponder()
    }
}
