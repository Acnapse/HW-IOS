import UIKit

func editTF(textField: UITextField, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat, security: Bool) {
    textField.placeholder = text
    textField.frame = CGRect(x: x, y: y, width: width, height: height)
    textField.font = UIFont(name: "Arial", size: size)
    textField.isSecureTextEntry = security
    textField.textAlignment = .center
    textField.backgroundColor = UIColor(red: 1, green: 0.64, blue: 0.007, alpha: 0.3)
    textField.layer.cornerRadius = 10
    textField.autocorrectionType = .no
}

func editButton(button: UIButton, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat) {
    button.frame = CGRect(x: x, y: y, width: width, height: height)
    button.setTitle(text, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    button.titleLabel?.font = UIFont(name: "Arial", size: size)
    button.layer.backgroundColor = UIColor.orange.cgColor
}

func editLabel(label: UILabel, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat, textColor: UIColor, align: NSTextAlignment) {
    label.textAlignment = align
    label.font = UIFont(name: "Arial", size: size)
    label.text = text
    label.frame = CGRect(x: x, y: y, width: width, height: height)
    label.textColor = textColor
}
func editSC (segmentControl: UISegmentedControl, y: Int) {
    let titleFont : UIFont = UIFont(name: "Arial", size: 15.0)!
    let attributes = [NSAttributedString.Key.font : titleFont]
    
    segmentControl.selectedSegmentIndex = 0
    segmentControl.frame = CGRect(x: 50, y: y, width: 310, height: 30)
    segmentControl.setTitleTextAttributes(attributes, for: .selected)
    segmentControl.setTitleTextAttributes(attributes, for: .normal)
}
