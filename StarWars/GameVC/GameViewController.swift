import UIKit

class GameViewController: UIViewController {
    let step: CGFloat = 20

    //MARK: - var\let
    private var timerOfStars = Timer()
    private var timerOfSpaceObjects = Timer()
    private var timerForIntersectsDetected = Timer()
    var starship: Starship = .firstStarship
    private var fuelView = SpaceObject()
    private var starshipView = UIImageView()


    private var informationPanelView = UIView()
    private var character = UIImageView()
    private var timeLabel = UILabel()
    private var iconIlumcrystal = UIImageView()
    private var ilumcrystalLabel = UILabel()

    private var buttonsAreaView = UIImageView()
    private var battleMapView = UIView()

    private var upButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrowtriangle.up.fill")
        button.setImage(image, for: UIControl.State.normal)
        button.backgroundColor = .white.withAlphaComponent(0.15)
        button.tintColor = .white.withAlphaComponent(0.8)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(touchDown1) , for: .touchDown)
        button.addTarget(self, action: #selector(touchUp1), for: .touchUpInside)
        button.addTarget(self, action: #selector(showAuth1), for: .touchUpOutside)
        return button
    }()

    private var downButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "arrowtriangle.down.fill")
        button.setImage(image, for: UIControl.State.normal)
        button.backgroundColor = .white.withAlphaComponent(0.15)
        button.tintColor = .white.withAlphaComponent(0.8)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(touchDown2) , for: .touchDown)
        button.addTarget(self, action: #selector(touchUp2), for: .touchUpInside)
        button.addTarget(self, action: #selector(showAuth2), for: .touchUpOutside)
        return button
    }()

    private var exitButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "pause.rectangle.fill")
        button.setImage(image, for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(touchExitButton) , for: .touchDown)
        return button
    }()

    //MARK: - life cycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        moveStarImageView()
        moveAsteroidImageView()
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(panRecognizerDetected))
        battleMapView.addGestureRecognizer(recognizer)
    }

    override func viewDidLayoutSubviews() {

        constraints()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @objc private func panRecognizerDetected(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        print(translation)
        starshipView.center = CGPoint(x: starshipView.center.x + translation.x,
                                y: starshipView.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, in: self.view)
    }


}



private extension GameViewController {
    //MARK: - flow funcs
    func configure(){
        view.backgroundColor = .black
        informationPanelView.backgroundColor = .black
//        character.image = UIImage(named: Settings.arrayCharacters[Settings.currentCharacter])
//        character.configureImage()
        timeLabel.textColor = .white
        iconIlumcrystal.image = UIImage(named:"Ilumcrystal")
        ilumcrystalLabel.text = "0"
        ilumcrystalLabel.textColor = .white

        upButton.layer.cornerRadius = 30
        downButton.layer.cornerRadius = 30

        buttonsAreaView.backgroundColor = .none
        fuelView.backgroundColor = .yellow
        battleMapView.backgroundColor = .black
        buttonsAreaView.image = UIImage(named: "background")
        buttonsAreaView.clipsToBounds = true
        battleMapView.clipsToBounds = true

        if starship == .firstStarship {
            starshipView.image = UIImage(named: "starship1")
        } else {
            starshipView.image = UIImage(named: "starship2")
        }

        starshipView.frame = CGRect(x: 30,
                                    y: 100,
                            width: 60,
                            height: 60)
        starshipView.layer.cornerRadius = 30
        starshipView.backgroundColor = .none


        buttonsAreaView.isUserInteractionEnabled = true

        battleMapView.addSubview(starshipView)

        [character,
         timeLabel,
         iconIlumcrystal,
         ilumcrystalLabel,
         exitButton
        ].forEach {
            self.informationPanelView.addSubview($0)
        }

        [upButton,
         downButton
        ].forEach {
            self.buttonsAreaView.addSubview($0)
        }


        [informationPanelView,
         battleMapView,
         fuelView,
         buttonsAreaView
        ].forEach {
            self.view.addSubview($0)
        }
    }

    func constraints(){
        informationPanelView.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        character.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        iconIlumcrystal.translatesAutoresizingMaskIntoConstraints = false
        ilumcrystalLabel.translatesAutoresizingMaskIntoConstraints = false

        battleMapView.translatesAutoresizingMaskIntoConstraints = false
        fuelView.translatesAutoresizingMaskIntoConstraints = false
        buttonsAreaView.translatesAutoresizingMaskIntoConstraints = false
        upButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            informationPanelView.topAnchor.constraint(equalTo: view.topAnchor),
            informationPanelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            informationPanelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            informationPanelView.heightAnchor.constraint(equalToConstant: 30),

            character.topAnchor.constraint(equalTo: informationPanelView.topAnchor, constant: 3),
            character.leadingAnchor.constraint(equalTo: informationPanelView.leadingAnchor,constant: 10),
            character.bottomAnchor.constraint(equalTo: informationPanelView.bottomAnchor, constant: -3),
            character.widthAnchor.constraint(equalToConstant: 30),

            timeLabel.topAnchor.constraint(equalTo: informationPanelView.topAnchor, constant: 3),
            timeLabel.leadingAnchor.constraint(equalTo: character.trailingAnchor,constant: 10),
            timeLabel.bottomAnchor.constraint(equalTo: informationPanelView.bottomAnchor, constant: -3),
            timeLabel.widthAnchor.constraint(equalToConstant: 40),

            iconIlumcrystal.topAnchor.constraint(equalTo: informationPanelView.topAnchor, constant: 3),
            iconIlumcrystal.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor,constant: 10),
            iconIlumcrystal.bottomAnchor.constraint(equalTo: informationPanelView.bottomAnchor, constant: -3),
            iconIlumcrystal.widthAnchor.constraint(equalToConstant: 20),

            ilumcrystalLabel.topAnchor.constraint(equalTo: informationPanelView.topAnchor, constant: 3),
            ilumcrystalLabel.leadingAnchor.constraint(equalTo: iconIlumcrystal.trailingAnchor,constant: 5),
            ilumcrystalLabel.bottomAnchor.constraint(equalTo: informationPanelView.bottomAnchor, constant: -3),
            ilumcrystalLabel.widthAnchor.constraint(equalToConstant: 40),

            exitButton.topAnchor.constraint(equalTo: informationPanelView.topAnchor),
            exitButton.trailingAnchor.constraint(equalTo: informationPanelView.trailingAnchor, constant: -10),
            exitButton.bottomAnchor.constraint(equalTo: informationPanelView.bottomAnchor),

            buttonsAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            buttonsAreaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonsAreaView.widthAnchor.constraint(equalToConstant: 60),
            buttonsAreaView.heightAnchor.constraint(equalToConstant: 150),

            upButton.topAnchor.constraint(equalTo: buttonsAreaView.topAnchor),
            upButton.leadingAnchor.constraint(equalTo: buttonsAreaView.leadingAnchor),
            upButton.trailingAnchor.constraint(equalTo: buttonsAreaView.trailingAnchor),

            downButton.heightAnchor.constraint(equalTo: upButton.heightAnchor),
            downButton.topAnchor.constraint(equalTo: upButton.bottomAnchor,constant: 30),
            downButton.leadingAnchor.constraint(equalTo: buttonsAreaView.leadingAnchor),
            downButton.trailingAnchor.constraint(equalTo: buttonsAreaView.trailingAnchor),
            downButton.bottomAnchor.constraint(equalTo: buttonsAreaView.bottomAnchor),


//            fuelView.topAnchor.constraint(equalTo: informationPanelView.bottomAnchor),
//            fuelView.leadingAnchor.constraint(equalTo: buttonsAreaView.trailingAnchor),
//            fuelView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            fuelView.widthAnchor.constraint(equalToConstant: 15),

            battleMapView.topAnchor.constraint(equalTo: informationPanelView.bottomAnchor),
            battleMapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            battleMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            battleMapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }

    func moveStarImageView(){
        var counter = 0
        timerOfStars = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] _ in
            counter += 1
            timeLabel.text = "\(counter)"
            let star = SpaceObject()
            let randomY = Int.random(in: 0...Int(view.frame.size.height))
            star.frame = CGRect(x: Int(view.frame.size.width),
                                y: randomY,
                                width: 1,
                                height: 1)
            star.backgroundColor = .white
            battleMapView.addSubview(star)

//            star.moveView(direction: .left, duration: 3.0, width: 100)
        })
    }

    func moveAsteroidImageView(){
        let array = ["asteroid", "fuel","asteroid1", "Ilumcrystal"]

        timerOfSpaceObjects = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] _ in

            let spaceObject = UIImageView()

            spaceObject.image = UIImage(named: array[Int.random(in: 0..<array.count)])
            let randomY = Int.random(in: 0...Int(view.frame.size.height))
            let randomSide = Int.random(in: 50...70)
            spaceObject.frame = CGRect(x: Int(view.frame.size.width),
                                y: randomY,
                                width: randomSide,
                                height: randomSide)

            spaceObject.backgroundColor = .none
            battleMapView.addSubview(spaceObject)
            timerForIntersectsDetected = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self]_ in
                intersectsDetected(for: spaceObject)
            })
            let randomSpeed = Double.random(in: 2.0...10.0)
            UIView.animate(withDuration: randomSpeed) {

                spaceObject.frame.origin.x = -100
            } completion: { _ in
                spaceObject.removeFromSuperview()
            }
        })
    }

    @objc private func showAuth1() {
        self.upButton.transform = .identity
    }

    @objc private func touchUp1() {
        self.upButton.transform = .identity
    }

    @objc private func touchDown1() {
        self.upButton.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        guard starshipView.frame.origin.y > step else { return }
        starshipView.center.y -= step
    }

    @objc private func showAuth2() {
        self.downButton.transform = .identity
    }

    @objc private func touchUp2() {
        self.downButton.transform = .identity
    }

    @objc private func touchDown2() {
        self.downButton.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        guard starshipView.frame.origin.y + starshipView.frame.size.height < battleMapView.frame.size.height - step else { return }
        starshipView.center.y += step
    }

    @objc private func touchExitButton() {
//        alert()
    }

//    func alert(){
//         let allertController = UIAlertController(title: "Exit", message: "Are you sure?", preferredStyle: .alert)
//
//         let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
//             Game.createAndSetUser(scoreLable: Int(self.timeLabel.text!)!,
//                                   IlumcrystalLabel: self.ilumcrystalLabel.text!,
//                                   dateLabel: "Stringasd")
//
//             self.navigationController?.popToRootViewController(animated: true)
//         }
//         let cancelAction = UIAlertAction(title: "Canel", style: .cancel)
//
//         allertController.addAction(okAction)
//         allertController.addAction(cancelAction)
//
//         present(allertController, animated: true)
//     }

    private func intersectsDetected(for object: UIImageView){
        print(#function)
        print(object.frame.origin.x)
//        guard let currentObject = object else { return }
        if object.frame.intersects(starshipView.frame){
            print("intersectsDetected")
        }
//        print("1")
    }

//    private func removeCircles(for newCircle: UIImageView){
//        for circle in circlesArray {
//            if newCircle.frame.intersects(circle.frame){
//                circle.removeFromSuperview()
//                circlesArray = circlesArray.filter({$0 != circle})
//            }
//        }
//    }
}



