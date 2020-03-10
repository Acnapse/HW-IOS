import UIKit

func editTF(textField: UITextField, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat, security: Bool) {
    textField.placeholder = text
    textField.frame = CGRect(x: x, y: y, width: width, height: height)
    textField.font = UIFont(name: "Arial", size: size)
    textField.isSecureTextEntry = security
    textField.textAlignment = .center
    textField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
    textField.autocorrectionType = .no
}

func editButton(button: UIButton, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat) {
    button.frame = CGRect(x: x, y: y, width: width, height: height)
    button.setTitle(text, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.layer.cornerRadius = 10
    button.titleLabel?.font = UIFont(name: "Arial", size: size)
    button.backgroundColor = UIColor(red: 0.23, green: 0.25, blue: 0.77, alpha: 1)
}

func editLabel(label: UILabel, text: String, x: Int, y: Int, width: Int, height: Int, size: CGFloat) {
    label.textAlignment = .center
    label.font = UIFont(name: "Arial", size: size)
    label.text = text
    label.frame = CGRect(x: x, y: y, width: width, height: height)
}

func alert (VC: UIViewController, title: String, message: String) {
    let alertC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertC.addAction(action)
    VC.present(alertC, animated: true, completion: nil)
}

func editSlider(slider: UISlider, y: Int, minTrackTintColor: UIColor, maxTrackTintColor: UIColor, thumbTintColor: UIColor) {
    slider.frame = CGRect(x: 20, y: y, width: 370, height: 20)
    slider.maximumTrackTintColor = maxTrackTintColor
    slider.minimumTrackTintColor = minTrackTintColor
    slider.thumbTintColor = thumbTintColor
}
