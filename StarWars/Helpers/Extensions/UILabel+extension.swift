import UIKit

extension UILabel {
    func confugure(with text: String, size: CGFloat ) {
        self.font = UIFont(name: "STARWARS", size: size)
        self.textAlignment = .center
        self.text = text
    }
}
