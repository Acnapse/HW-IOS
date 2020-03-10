import UIKit

func addTextField(view: UIView, textField: UITextField, y: Int, placeholder: String, security: Bool) {
    textField.placeholder = placeholder
    textField.frame = CGRect(x: 100, y: y, width: 220, height: 50)
    textField.contentVerticalAlignment = .center
    textField.textAlignment = .center
    textField.borderStyle = .roundedRect
    textField.font = UIFont(name: "Arial", size: 25.0)
    textField.autocapitalizationType = .none
    textField.isSecureTextEntry = security
    view.addSubview(textField)
}

func addButton(view: UIView, button: UIButton, y: Int, text: String, flag: Int) {
    button.frame = CGRect(x: 0, y: y, width: 130, height: 50)
    button.layer.cornerRadius = 10
    button.center.x = view.center.x
    if flag == 0 {
        button.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 25.0)
    } else {
        let color = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20.0)
    }
    button.setTitle(text, for: .normal)
    view.addSubview(button)
}

func addLabel(label: UILabel, view: UIView, name: String, login: String, pass: String) {
    label.font = UIFont.systemFont(ofSize: 25.0)
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.frame = CGRect(x: 0, y: 230, width: 350, height: 350)
    label.center.x = view.center.x
    label.text = "Ув. \(name) !\n\nРегистрация прошла успешно, теперь вы можете выполнить вход.\n\nCохраните ваш логи и пароль, чтобы не потерять.\n\nЛогин: \(login)\nПароль: \(pass)"
    view.addSubview(label)
}
