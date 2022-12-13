import UIKit

extension UIImageView {

    func configureImage(name: String){
        self.image = UIImage(named: name)
        configureBorderImage()
        configureImage()
    }

    func configureImage(systemName: String){
        self.image = UIImage(systemName: systemName)
        configureBorderImage()
        configureImage()
    }

    func configureBorderImage(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }

    func configureImage(){
        self.layer.cornerRadius = 10
        self.backgroundColor = .black
        self.tintColor = .white
        self.contentMode = .scaleAspectFit
        self.isUserInteractionEnabled = true
    }

}
