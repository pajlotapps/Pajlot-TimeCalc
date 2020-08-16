
import UIKit

@IBDesignable
class RoundedCalcBtn: UIButton {
    
    @IBInspectable var roundedButton: Bool = false {
        didSet {
            if roundedButton {
                layer.cornerRadius = 10
                
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundedButton {
            layer.cornerRadius = 10
        }
    }
}

@IBDesignable
class OvalBtn: UIButton {
    
    @IBInspectable var ovalButton: Bool = false {
        didSet {
            if ovalButton {
                layer.cornerRadius = frame.width / 2
                
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if ovalButton {
            layer.cornerRadius = frame.width / 2
        }
    }
}
