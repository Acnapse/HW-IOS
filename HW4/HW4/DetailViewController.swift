import UIKit

class DetailViewController: UIViewController {
    
    let backgroundImage = UIImageView(image: #imageLiteral(resourceName: "NY2"))
    
    let backButton = UIButton(type: .system)
    let calcButton = UIButton()
    
    let areaTextField = UITextField()
    let rateTextField = UITextField()
    let termsTextField = UITextField()
    let indexTextField = UITextField()
    
    let vatLabel = UILabel()
    let utilitiesLabel = UILabel()
    let contractLabel = UILabel()
    
    let vatSwitch = UISwitch()
    let utilSwitch = UISwitch()
    let contrSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Редактируем фон
        backgroundImage.frame = self.view.frame
        
        //Редактируем кнопки
        editButton(button: backButton, text: "Back", y: 50, backgroundColor: .white, width: 100, color: .gray)
        editButton(button: calcButton, text: "CALCULATE!", y: 600, backgroundColor: .blue, width: 150, color: .white)
        
        //Редактируем textField's
        editTextField(textField: areaTextField, text: "Type a rental area (sq.m)", y: 250)
        editTextField(textField: rateTextField, text: "Type a rental rate (RUB/sq.m)", y: 300)
        editTextField(textField: termsTextField, text: "Type terms (years)", y: 500)
        editTextField(textField: indexTextField, text: "Type an annual indexation (%)", y: 550)
        
        //Редактируем label's
        editLabel(label: vatLabel, text: "Including VAT (18%)", y: 350)
        editLabel(label: utilitiesLabel, text: "Including utilities (10%)", y: 400)
        editLabel(label: contractLabel, text: "Short-term contract", y: 450)
        
        //Редактрируем switch's
        vatSwitch.frame = CGRect(x: 260, y: 350, width: 0, height: 0)
        utilSwitch.frame = CGRect(x: 260, y: 400, width: 0, height: 0)
        contrSwitch.frame = CGRect(x: 260, y: 450, width: 0, height: 0)
        
        self.backButton.addTarget(self, action: #selector(backButtonIsPressed(sender:)), for: .touchUpInside)
        self.calcButton.addTarget(self, action: #selector(buttonIsPressed(target:)), for: .touchUpInside)
       
        // Добавляем элементы UI в главное представление
        self.view.addSubview(backgroundImage)
        self.view.addSubview(backButton)
        self.view.addSubview(areaTextField)
        self.view.addSubview(rateTextField)
        self.view.addSubview(termsTextField)
        self.view.addSubview(indexTextField)
        self.view.addSubview(vatLabel)
        self.view.addSubview(utilitiesLabel)
        self.view.addSubview(contractLabel)
        self.view.addSubview(vatSwitch)
        self.view.addSubview(utilSwitch)
        self.view.addSubview(contrSwitch)
        self.view.addSubview(calcButton)
    }
    
    @objc func backButtonIsPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func buttonIsPressed(target: UIButton) {
        let area = Double(areaTextField.text!)!
        var rate = Double(rateTextField.text!)!
        var terms: Int
        var total = 0.0
        var result = 0.0
        
        if !contrSwitch.isOn {
            if (termsTextField.text?.isEmpty)! || (indexTextField.text?.isEmpty)!  {
                defineAlert(title: "ERROR: Fill in all the fields!")
                return
            }
            terms = Int(termsTextField.text!)!
            let indexation = Double(indexTextField.text!)!
            for i in 1...terms {
                var index: Double
                var yearCost = 0.0
                if i == 1 {
                    index = 0.0
                } else {
                    index = indexation
                }
                rate += rate * (index / 100.0)
                yearCost = area * rate * 12
                total += yearCost
            }
        } else {
            terms = 11
            result = area * rate * Double(terms)
        }
        
        var title: String;
        let vat = Double(result) - Double(result) * 0.18
        switch (vatSwitch.isOn, utilSwitch.isOn) {
        case (true, true):
            total = vat - vat * 0.1
            title = "The total cost of \(terms) years lease contract:\n \(total) RUB\nincluding VAT and utilities."
        case (false, false):
            title = "The total cost of \(terms) years lease contract:\n \(result) RUB\nexcluding VAT and utilities."
        case (true, false):
            total = Double(result) - Double(result) * 0.18
            title = "The total cost of \(terms) years lease contract:\n \(vat) RUB\nincluding VAT, excluding utilities."
        case (false, true):
            total = Double(result) - Double(result) * 0.1
            title = "The total cost of \(terms) years lease contract:\n \(total) RUB\nexcluding VAT, including utilities."
        }
        defineAlert(title: title)
    }
    
    func editTextField(textField: UITextField, text: String, y: Int) {
        textField.placeholder = text
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Times New Roman", size: 22.0)
        textField.frame = CGRect(x: 10, y: y, width: 300, height: 40)
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.numberPad
        textField.textColor = .gray
    }
    
    func editLabel(label: UILabel, text: String, y: Int) {
        label.text = text
        label.frame = CGRect(x: 10, y: y, width: 250, height: 40)
        label.font = UIFont(name: "Times New Roman", size: 22.0)
        label.textColor = .white
    }
    
    func editButton(button: UIButton, text: String, y: Int, backgroundColor: UIColor, width: Int, color: UIColor) {
        button.setTitle(text, for: .normal)
        button.frame = CGRect(x: 10, y: y, width: width, height: 40)
        button.backgroundColor = backgroundColor
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0)
    }
    
    func defineAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
