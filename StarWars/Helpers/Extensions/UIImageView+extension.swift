import UIKit

extension UIImageView {

    func configureImage(name: String, isSystemName: Bool){
        switch isSystemName {
        case true:
            self.image = UIImage(systemName: name)
        case false:
            self.image = UIImage(named: name)
        }
        configureBorderImage()
        configureImage()
    }

    private func configureBorderImage(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }

    private func configureImage(){
        self.layer.cornerRadius = 10
        self.backgroundColor = .black
        self.tintColor = .white
        self.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
    }
}
