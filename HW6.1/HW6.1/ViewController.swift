import UIKit

class ViewController: UIViewController {
    
    let mainLabel = UILabel()
    let smallLabel = UILabel()

    let loginTF = UITextField()
    let passwordTF = UITextField()
    
    let showSwitch = UISwitch()
    
    let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.34, green: 0.37, blue: 0.81, alpha: 1)
        
        editLabel(label: mainLabel, text: "Привет!", x: 0, y: 200, width: Int(view.frame.width), height: 70, size: 50.0)
        editLabel(label: smallLabel, text: "Показать пароль", x: 90, y: 470, width: 250, height: 30, size: 25.0)
        
        showSwitch.isOn = false
        showSwitch.frame = CGRect(x: 50, y: 470, width: 0, height: 0)
        showSwitch.onTintColor = UIColor(red: 0.23, green: 0.25, blue: 0.77, alpha: 1)
        
        editTF(textField: loginTF, text: "Почта", x: 50, y: 340, width: 310, height: 50, size: 30.0, security: false)
        editTF(textField: passwordTF, text: "Пароль", x: 50, y: 400, width: 310, height: 50, size: 30.0, security: true)
        
        editButton(button: enterButton, text: "Вход", x: 130, y: 550, width: 150, height: 70, size: 30.0)        
        
        showSwitch.addTarget(self, action: #selector(showSwitchIsChanged(_:)), for: .valueChanged)
        enterButton.addTarget(self, action: #selector(enterButtonIsPressed(_:)), for: .touchUpInside)
        
        view.addSubview(loginTF)
        view.addSubview(passwordTF)
        view.addSubview(enterButton)
        view.addSubview(mainLabel)
        view.addSubview(smallLabel)
        view.addSubview(showSwitch)
    }
    
    //MARK: - Action
    @objc func enterButtonIsPressed(_: UIButton) {
        let segue = UIStoryboard(name: "Main", bundle: nil)
        guard let VC: SettingsVC = segue.instantiateViewController(withIdentifier: "settings") as? SettingsVC else {
            print("Couldn't instantiate View Controller with identifier")
            return
        }
        if (loginTF.text?.isEmpty)! || (passwordTF.text?.isEmpty)! {
            alert(VC: self, title: "ВНИМАНИЕ!", message: "Заполните все поля")
            return
        }
        VC.mail = mainLabel.text
        present(VC, animated: true, completion: nil)
    }
    
    @objc func showSwitchIsChanged(_: UIButton) {
        if showSwitch.isOn {
            passwordTF.isSecureTextEntry = false
        } else {
            passwordTF.isSecureTextEntry = true
        }
    }

}

