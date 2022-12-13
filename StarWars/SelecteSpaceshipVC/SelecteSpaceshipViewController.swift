import UIKit

enum Starship {
    case firstStarship
    case secondStarship
}

final class SelecteSpaceshipViewController: UIViewController {

    //MARK: - var\let
    private var timerForStars = Timer()
    private var speedOfStars: CGFloat = 2

    private var contanerOfViews = UIView()

    private var firstStarship: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "starship1")
        button.setImage(image, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(touchDown1) , for: .touchDown)
        button.addTarget(self, action: #selector(touchUp1), for: .touchUpInside)
        button.addTarget(self, action: #selector(showAuth1), for: .touchUpOutside)
        return button
    }()

    private var secondStarship: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "starship2")
        button.setImage(image, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(touchDown2) , for: .touchDown)
        button.addTarget(self, action: #selector(touchUp2), for: .touchUpInside)
        button.addTarget(self, action: #selector(showAuth2), for: .touchUpOutside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        constraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        starsAnimate()
        starshipsAnimate()
    }

    //MARK: - objc

    @objc private func touchDown1() {
        UIView.animate(withDuration: 0.2) {
            self.firstStarship.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        }
    }

    @objc private func touchUp1() {
        UIView.animate(withDuration: 0.1) {
            self.firstStarship.transform = .identity
        } completion: { [self] _ in
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return }
            controller.starship = .firstStarship
            pushViewController(controller: controller)
        }
    }

    @objc private func showAuth1() {
        UIView.animate(withDuration: 0.1) {
            self.firstStarship.transform = .identity
        }
    }

    @objc private func touchDown2() {
        UIView.animate(withDuration: 0.2) {
            self.secondStarship.transform = CGAffineTransform.init(scaleX: 0.97, y: 0.97)
        }
    }

    @objc private func touchUp2() {

        UIView.animate(withDuration: 0.1) {
            self.secondStarship.transform = .identity
        } completion: { [self] _ in
            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return }
            controller.starship = .secondStarship
            pushViewController(controller: controller)
        }
    }

    @objc private func showAuth2() {

        UIView.animate(withDuration: 0.1) {
            self.secondStarship.transform = .identity
        }
    }

    private func pushViewController(controller: GameViewController){
        UIView.animate(withDuration: 1) { [self] in
            contanerOfViews.frame.origin.x += view.frame.size.width
        } completion: { _ in
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}


private extension SelecteSpaceshipViewController {

    func configure() {
        view.backgroundColor = .black

        contanerOfViews.backgroundColor = .none

        let width: CGFloat = view.frame.width * 2 / 3
        let height: CGFloat = view.frame.height * 2 / 3
        contanerOfViews.frame.size.width = width
        contanerOfViews.frame.size.height = height
        contanerOfViews.frame.origin.x = -(view.frame.size.width + contanerOfViews.frame.size.width)
        contanerOfViews.frame.origin.y = 50

        contanerOfViews.addSubview(firstStarship)
        contanerOfViews.addSubview(secondStarship)

        view.addSubview(contanerOfViews)

    }

    func constraints(){
        let space: CGFloat = 80
        firstStarship.translatesAutoresizingMaskIntoConstraints = false
        secondStarship.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstStarship.topAnchor.constraint(equalTo: contanerOfViews.topAnchor),
            firstStarship.leadingAnchor.constraint(equalTo: contanerOfViews.leadingAnchor),
            firstStarship.bottomAnchor.constraint(equalTo: contanerOfViews.bottomAnchor),

            secondStarship.topAnchor.constraint(equalTo: contanerOfViews.topAnchor),
            secondStarship.leadingAnchor.constraint(equalTo: firstStarship.trailingAnchor, constant: space),
            secondStarship.trailingAnchor.constraint(equalTo: contanerOfViews.trailingAnchor),
            secondStarship.bottomAnchor.constraint(equalTo: contanerOfViews.bottomAnchor),
            secondStarship.widthAnchor.constraint(equalTo:  firstStarship.widthAnchor),
        ])
    }

    func starshipsAnimate(){
        
        UIView.animate(withDuration: 5, delay: 2) {
            self.contanerOfViews.center.x = self.view.center.x
        } completion: { _ in
            self.timerForStars.invalidate()
            self.starsAnimate(duration: 4, width: 100)
            self.timerForStars.fire()
        }
    }

    func starsAnimate(duration: Double = 4, width: CGFloat = 1000){
        timerForStars = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] _ in
            let stars = SpaceObject()
            let randomY = Int.random(in: 0...Int(view.frame.size.height))
            stars.frame = CGRect(x: Int(view.frame.size.width + width),
                                y: randomY,
                                width: 1,
                                height: 1)
            stars.backgroundColor = .white
            view.addSubview(stars)
            stars.moveView(direction: .left, duration: duration, width: width)
        })
    }
}

