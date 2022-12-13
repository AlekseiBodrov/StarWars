import UIKit

enum Direction{
    case left
    case right
}

class SpaceObject: UIView {

    let imageView: UIImageView? = nil

    deinit{
//        print("Stars deinit")
    }

    func moveView(direction: Direction, duration: Double, width: CGFloat){

        UIView.animate(withDuration: duration) {
            self.frame.origin.x = -width
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}
