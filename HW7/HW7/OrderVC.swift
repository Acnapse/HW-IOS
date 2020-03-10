import UIKit

class OrderVC: UIViewController {

    let backButton = UIButton()
    let orderButton = UIButton()
    
    let headerLabel = UILabel()
    
    let nameTF = UITextField()
    let adressTF = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton(button: backButton, text: "Назад", x: 20, y: 70, width: 100, height: 40, size: 20.0)
        editButton(button: orderButton, text: "Заказать", x: 150, y: 500, width: 115, height: 40, size: 20.0)
        
        editLabel(label: headerLabel, text: "Введите данные для заказа", x: 0, y: 270, width: Int(view.frame.width), height: 50, size: 23.0, textColor: .black, align: .center)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)

        editTF(textField: nameTF, text: "Имя", x: 50, y: 360, width: 310, height: 40, size: 20.0, security: false)
        editTF(textField: adressTF, text: "Адрес", x: 50, y: 420, width: 310, height: 40, size: 20.0, security: false)
        
        backButton.addTarget(self, action: #selector(backButtonIsPressed(sender:)), for: .touchUpInside)
        orderButton.addTarget(self, action: #selector(orderButtonIsPressed(sender:)), for: .touchUpInside)
        
        view.addSubview(backButton)
        view.addSubview(orderButton)
        view.addSubview(headerLabel)
        view.addSubview(nameTF)
        view.addSubview(adressTF)
    }
    
    @objc func backButtonIsPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func orderButtonIsPressed(sender: UIButton) {
        var title: String
        var message: String
        if !(nameTF.text?.isEmpty)! && !(adressTF.text?.isEmpty)! {
            title = "УРА!"
            message = "Заказ успешно оформлен"
        } else {
            title = "ВНИМАНИЕ!"
            message = "Заполните все поля"
        }
        let alertC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertC.addAction(action)
        present(alertC, animated: true, completion: nil)
    }

}
