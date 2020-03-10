//
//  DeveloperVC.swift
//  HW5.2
//
//  Created by Марина on 03.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class DeveloperVC: UIViewController {
    
    let backButton = UIButton()
    let saveButton = UIButton()
    
    let nameTF = UITextField()
    let lastNameTF = UITextField()
    let passwordTF = UITextField()
    let creditCardTF = UITextField()
    let mailTF = UITextField()
    let technologyTF = UITextField()
    let experienceTF = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.01, green: 0.76, blue: 0.41, alpha: 1)
        
        editButton(button: backButton, text: "Назад", textColor: .black, x: 10, y: 50, width: 100, height: 70)
        editButton(button: saveButton, text: "Сохранить", textColor: .black, x: 110, y: 640, width: 200, height: 70)
        
        editTF(textField: nameTF, text: "Имя", y: 150, security: false)
        editTF(textField: lastNameTF, text: "Фамилия", y: 220, security: false)
        editTF(textField: passwordTF, text: "Пароль", y: 290, security: true)
        editTF(textField: creditCardTF, text: "Последние 4 цифры карты", y: 360, security: true)
        editTF(textField: mailTF, text: "Почта", y: 430, security: false)
        editTF(textField: technologyTF, text: "Технология", y: 500, security: true)
        editTF(textField: experienceTF, text: "Опыт (в годах)", y: 570, security: false)
        creditCardTF.keyboardType = .numberPad
        experienceTF.keyboardType = .numberPad
        
        backButton.addTarget(self, action: #selector(backButtonIsPressed(sender:)), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonIsPressed(sender:)), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.addSubview(nameTF)
        view.addSubview(lastNameTF)
        view.addSubview(passwordTF)
        view.addSubview(creditCardTF)
        view.addSubview(mailTF)
        view.addSubview(technologyTF)
        view.addSubview(experienceTF)
        view.addSubview(saveButton)
    }
    
    @objc func backButtonIsPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func alert (title: String, message: String, allRight: Bool){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (Alert) in
            if (allRight) {
                self.dismiss(animated: true, completion: nil)
            }
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func saveButtonIsPressed(sender: UIButton) {
        var title = "Внимание!"
        var message = ""
        var allRight = false
        if ((nameTF.text?.isEmpty)!) {
            message = "Введите свое имя"
        }
        else if ((lastNameTF.text?.isEmpty)!) {
            message = "Введите свою фамилию"
        }
        else if ((passwordTF.text?.isEmpty)!) {
            message = "Введите пароль"
        }
        else if (creditCardTF.text?.count != 4 && creditCardTF.keyboardType == .numberPad) {
            message = "Введите корректные данные\n в поле банковской карты"
        }
        else if ((technologyTF.text?.isEmpty)!) {
            message = "Введите технологию"
        }
        else if ((experienceTF.text?.isEmpty)! && experienceTF.keyboardType == .numberPad) {
            message = "Введите свой опыт\n в корректной форме"
        }
        else {
            title = "Регистрация завершена!"
            message = "Все данные сохранены"
            allRight = true
        }
        alert(title: title, message: message, allRight: allRight)
    }
    
    func editButton(button: UIButton, text: String, textColor: UIColor, x: Int, y: Int, width: Int, height: Int) {
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.titleLabel?.font = UIFont(name: "Arial", size: 30.0)
    }
    
    func editTF(textField: UITextField, text: String, y: Int, security: Bool) {
        textField.placeholder = text
        textField.frame = CGRect(x: 20, y: y, width: 370, height: 50)
        textField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        textField.font = UIFont(name: "Arial", size: 25.0)
        textField.autocorrectionType = .no
        textField.textAlignment = .center
        textField.isSecureTextEntry = security
    }
    
}
