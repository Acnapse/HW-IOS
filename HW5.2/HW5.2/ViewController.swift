//
//  ViewController.swift
//  HW5.2
//
//  Created by Марина on 03.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

let dataSource = ["Клиент", "Разработчик"]
var role = dataSource[0]

class ViewController: UIViewController {
    
    let registButton = UIButton()
    let rolePicker = UIPickerView()
    let label = UILabel()
    let roleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.96, green: 0.94, blue: 0.908, alpha: 1)
        
        label.frame = CGRect(x: 0, y: 200, width: Int(self.view.frame.width), height: 50)
        label.text = "Здравствуйте!"
        label.textAlignment = .center
        label.textColor = .purple
        label.font = UIFont(name: "Arial", size: 45.0)
        
        rolePicker.center = view.center
        rolePicker.dataSource = self
        rolePicker.delegate = self
        
        
        registButton.frame = CGRect(x: 0, y: 600, width: Int(self.view.frame.width), height: 100)
        registButton.setTitle("Регистрация для", for: .normal)
        registButton.titleLabel?.font = UIFont(name: "Arial", size: 40.0)
        registButton.layer.cornerRadius = 10
        registButton.setTitleColor(.purple, for: .normal)
        registButton.titleLabel?.textAlignment = .center

        registButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(registButton)
        self.view.addSubview(rolePicker)
        self.view.addSubview(label)
        self.view.addSubview(roleLabel)
    }
    
    @objc func buttonIsPressed(sender: UIButton) {
        let segue = UIStoryboard(name: "Main", bundle: nil)
        switch role {
        case "Клиент":
            guard let VC: ClientVC = segue.instantiateViewController(withIdentifier: "client") as? ClientVC else {
                print("Couldn't instantiate View Controller with identifier")
                return
            }
            present(VC, animated: true, completion: nil)
        case "Разработчик":
            guard let VC: DeveloperVC = segue.instantiateViewController(withIdentifier: "developer") as? DeveloperVC else {
                print("Couldn't instantiate View Controller with identifier")
                return
            }
            present(VC, animated: true, completion: nil)
        default: return
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        role = dataSource[row]
        roleLabel.text = role + "a"
        roleLabel.frame = CGRect(x: 0, y: 670, width: Int(self.view.frame.width), height: 50)
        roleLabel.textAlignment = .center
        switch row {
        case 0: roleLabel.textColor = UIColor(red: 1, green: 0.86, blue: 0.34, alpha: 1)
        case 1: roleLabel.textColor = UIColor(red: 0.01, green: 0.76, blue: 0.41, alpha: 1)
        default: roleLabel.textColor = .purple
        }
        roleLabel.font = UIFont(name: "Arial", size: 40.0)
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 100))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 100))
        label.text = dataSource[row]
        label.font = UIFont(name: "Arial", size: 40.0)
        label.textAlignment = .center
        label.textColor = .purple
        view.addSubview(label)
        
        return view
    }
}

