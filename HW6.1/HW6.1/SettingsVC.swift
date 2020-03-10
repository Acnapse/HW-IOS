//
//  SettingsVC.swift
//  HW6.1
//
//  Created by Марина on 03.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

let dataSource = ["Мужской", "Женский", "Неизвестно"]
var sexWasSelected: String!
class SettingsVC: UIViewController {
    
    var mail: String!
    
    let sexLabel = UILabel()
    let headerLabel = UILabel()
    let resultLabel = UILabel()
    
    let sexPicker = UIPickerView()
    
    let nameTF = UITextField()
    let secondNameTF = UITextField()
    
    let redSlider = UISlider()
    let greenSlider = UISlider()
    let blueSlider = UISlider()
    
    let saveButton = UIButton()
    
    var red: CGFloat = 0.34
    var green: CGFloat = 0.37
    var blue: CGFloat = 0.81

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)

        editLabel(label: headerLabel, text: "Настройки", x: 0, y: 90, width: Int(view.frame.width), height: 70, size: 50.0)
        editLabel(label: sexLabel, text: "Выберите пол", x: 20, y: 200, width: 200, height: 40, size: 30.0)
        
        sexPicker.dataSource = self
        sexPicker.delegate = self
        sexPicker.frame = CGRect(x: 220, y: 180, width: 200, height: 80)
        
        editTF(textField: nameTF, text: "Имя", x: 20, y: 300, width: 370, height: 50, size: 30.0, security: false)
        editTF(textField: secondNameTF, text: "Ник", x: 20, y: 360, width: 370, height: 50, size: 30.0, security: false)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        editSlider(slider: redSlider, y: 470, minTrackTintColor: .red, maxTrackTintColor: .white, thumbTintColor: .red)
        editSlider(slider: greenSlider, y: 520, minTrackTintColor: .green, maxTrackTintColor: .white, thumbTintColor: .green)
        editSlider(slider: blueSlider, y: 570, minTrackTintColor: .blue, maxTrackTintColor: .white, thumbTintColor: .blue)
        
        editButton(button: saveButton, text: "Сохранить", x: 120, y: 750, width: 200, height: 70, size: 30.0)
        
        editLabel(label: resultLabel, text: "(\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255)))", x: 20, y: 620, width: Int(view.frame.width), height: 70, size: 40.0)
        
        redSlider.addTarget(self, action: #selector(redSliderIsChanged(sender:)), for: .valueChanged)
        greenSlider.addTarget(self, action: #selector(greenSliderIsChanged(sender:)), for: .valueChanged)
        blueSlider.addTarget(self, action: #selector(blueSliderIsChanged(sender:)), for: .valueChanged)
        saveButton.addTarget(self, action: #selector(saveButtonIsPressed(_:)), for: .touchUpInside)
        
        view.addSubview(headerLabel)
        view.addSubview(sexLabel)
        view.addSubview(sexPicker)
        view.addSubview(nameTF)
        view.addSubview(secondNameTF)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(saveButton)
        view.addSubview(resultLabel)
    }
    
    @objc func redSliderIsChanged(sender: UISlider) {
        red = CGFloat(sender.value)
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        resultLabel.text = "(\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255)))"
    }
    
    @objc func greenSliderIsChanged(sender: UISlider) {
        green = CGFloat(sender.value)
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        resultLabel.text = "(\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255)))"
    }
    
    @objc func blueSliderIsChanged(sender: UISlider) {
        blue = CGFloat(sender.value)
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        resultLabel.text = "(\(Int(red * 255)), \(Int(green * 255)), \(Int(blue * 255)))"
    }
    
    @objc func saveButtonIsPressed(_: UIButton) {
        let segue = UIStoryboard(name: "Main", bundle: nil)
        guard let VC: PlayerSaveVC = segue.instantiateViewController(withIdentifier: "player") as? PlayerSaveVC else {
            print("Couldn't instantiate View Controller with identifier")
            return
        }
        if (nameTF.text?.isEmpty)! || (secondNameTF.text?.isEmpty)! {
            alert(VC: self, title: "ВНИМАНИЕ!", message: "Заполните все поля")
            return
        }
        
        let defaults = UserDefaults.standard
        
        defaults.set(nameTF.text, forKey: "name")
        defaults.set(secondNameTF.text, forKey: "nick")
        defaults.set(Float(red), forKey: "red")
        defaults.set(Float(green), forKey: "green")
        defaults.set(Float(blue), forKey: "blue")
        
        present(VC, animated: true, completion: nil)
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        if let nameText = defaults.string(forKey: "name") {
            nameTF.text = nameText
        }
        if let nickText = defaults.string(forKey: "nick") {
            secondNameTF.text = nickText
        }
        if defaults.float(forKey: "red") != 0 {
            red = CGFloat(defaults.float(forKey: "red"))
        }
        if defaults.float(forKey: "green") != 0 {
            green = CGFloat(defaults.float(forKey: "green"))
        }
        if defaults.float(forKey: "blue") != 0 {
            blue = CGFloat(defaults.float(forKey: "blue"))
        }
    }

}

extension SettingsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexWasSelected = dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 60))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 60))
        label.text = dataSource[row]
        label.font = UIFont(name: "Arial", size: 30.0)
        label.textAlignment = .center
        view.addSubview(label)
        
        return view
    }
}
