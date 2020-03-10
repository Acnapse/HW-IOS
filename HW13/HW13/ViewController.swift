import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let loginTextField = UITextField()
    let passTextField = UITextField()
    let nameTextField = UITextField()
    
    let signInButton = UIButton()
    let signUPButton = UIButton(type: .system)
    
    let errorLabel = UILabel()
    
    var registeredUsersDictionary = ["Login" : "Pass"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        addTextField(view: view, textField: loginTextField, y: 300, placeholder: "Login", security: false)
        addTextField(view: view, textField: passTextField, y: 380, placeholder: "Password", security: true)
        addTextField(view: view, textField: nameTextField, y: 460, placeholder: "Enter name*", security: false)
        nameTextField.isHidden = true
        
        addButton(view: view, button: signInButton, y: 600, text: "Sign In", flag: 0)
        addButton(view: view, button: signUPButton, y: 660, text: "Sign Up", flag: 1)
        
        loginTextField.delegate = self
        passTextField.delegate = self
        
        signInButton.addTarget(self, action: #selector(signInButtonIsPressed), for: .touchUpInside)
        signUPButton.addTarget(self, action: #selector(signUpButtonIsPressed), for: .touchUpInside)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passTextField.becomeFirstResponder()
        } else if textField == passTextField && nameTextField.isHidden == false {
            nameTextField.becomeFirstResponder()
        } else if textField == passTextField {
            textField.resignFirstResponder()
        } else if textField == nameTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @objc func signInButtonIsPressed() {
        print(signInButton.title(for: .normal)!)
        if signInButton.title(for: .normal)! == "Sign In" {
            for (login, pass) in registeredUsersDictionary {
                if loginTextField.text == login && passTextField.text == pass {
                    errorLabel.isHidden = true
                    let alertController = UIAlertController(title: "Hi, \(String(describing: registeredUsersDictionary[loginTextField.text!]?.first))!", message: "Glad to see you again in our app", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action) in}
                    alertController.addAction(action)
                    present(alertController, animated: true, completion: nil)
                    break
                } else if loginTextField.text?.isEmpty == false || passTextField.text?.isEmpty == false {
                    errorLabel.isHidden = false
                    errorLabel.text = "Wrong password/login :("
                    errorLabel.frame = CGRect(x: 0, y: 500, width: Int(self.view.frame.width), height: 50)
                    errorLabel.textAlignment = .center
                    errorLabel.font = UIFont(name: "Arial", size: 25.0)
                    view.addSubview(errorLabel)
                }
            }
        } else {
            let loginEmpty = (self.loginTextField.text?.isEmpty)!
            let passEmpty = (self.passTextField.text?.isEmpty)!
            let nameEmpty = (self.nameTextField.text?.isEmpty)!
            if !loginEmpty && !passEmpty && !nameEmpty {
                registeredUsersDictionary[loginTextField.text!] = passTextField.text
                signInButton.setTitle("Sign In", for: .normal)
                signUPButton.isHidden = false
                nameTextField.text = ""
                
                let secVC = storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
                navigationController?.pushViewController(secVC, animated: true)
                
                secVC.login = loginTextField
                secVC.pass = passTextField
                secVC.name = nameTextField
                
            } else {
                let alertController = UIAlertController(title: "ERROR", message: "Enter all fields", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    if loginEmpty {
                        self.loginTextField.becomeFirstResponder()
                    } else if passEmpty {
                        self.passTextField.becomeFirstResponder()
                    } else if nameEmpty {
                        self.nameTextField.becomeFirstResponder()
                    }
                }
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @objc func signUpButtonIsPressed() {
        clearTF()
        self.nameTextField.isHidden = false
        self.loginTextField.becomeFirstResponder()
        signUPButton.isHidden = true
        errorLabel.isHidden = true
        signInButton.setTitle("Sign Up", for: .normal)
    }
    
    func clearTF () {
        self.loginTextField.text = ""
        self.passTextField.text = ""
        self.loginTextField.placeholder = "Enter login*"
        self.passTextField.placeholder = "Enter password*"
    }
}

