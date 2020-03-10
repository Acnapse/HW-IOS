import UIKit

class SecondViewController: UIViewController {
    
    let labelStep = UILabel()
    
    let leftButton = UIButton()
    let rightButton = UIButton()
    
    let imagesArray = [UIImage(named: "step1.jpg"),
                      UIImage(named: "step2.jpg"),
                      UIImage(named: "step31.jpg"),
                      UIImage(named: "step32.jpg"),
                      UIImage(named: "step4.jpg"),
                      UIImage(named: "step5.jpg"),
                      UIImage(named: "step6.jpg"),
                      UIImage(named: "step7.jpg")]
    
    var imageView = UIImageView()
    
    var indexOfStep = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Главная"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "info"), style: .done, target: self, action: #selector(infoPressed(_:)))
        
        editLabel(label: labelStep)
        editButton(button: leftButton, x: 50)
        editButton(button: rightButton, x: 260)
        changeData()
        
        leftButton.addTarget(self, action: #selector(leftButtonIsPressed(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonIsPressed(_:)), for: .touchUpInside)
        
    }
    
    @objc func infoPressed(_: UIBarButtonItem) {
        let infoVC = InfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
    }
    
    @objc func rightButtonIsPressed(_: UIButton) {
        indexOfStep += 1
        changeData()
    }
    
    @objc func leftButtonIsPressed(_: UIButton) {
        indexOfStep -= 1
        changeData()
    }
    
    fileprivate func changeData() {
        imageView.removeFromSuperview()
        imageView = UIImageView(image: imagesArray[indexOfStep])
        imageView.center = view.center
        view.addSubview(imageView)
        
        leftButton.isHidden = false
        rightButton.isHidden = false
        
        print(indexOfStep)
        
        if indexOfStep == 0 {
            leftButton.isHidden = true
            labelStep.text = "Шаг \(indexOfStep + 1) из 7"
            rightButton.setTitle("Шаг \(indexOfStep + 2)", for: .normal)
        } else if indexOfStep == 2 {
            labelStep.text = "Шаг 3 из 7"
            leftButton.setTitle("Шаг 2", for: .normal)
            rightButton.setTitle("...", for: .normal)
        } else if indexOfStep == 3 {
            labelStep.text = "Шаг 3 из 7"
            leftButton.setTitle("Шаг ...", for: .normal)
            rightButton.setTitle("Шаг 4", for: .normal)
        } else if indexOfStep == 7 {
            labelStep.text = "Шаг 7 из 7"
            leftButton.setTitle("Шаг 6", for: .normal)
            rightButton.isHidden = true
        } else if indexOfStep > 3 {
            labelStep.text = "Шаг \(indexOfStep) из 7"
            leftButton.setTitle("Шаг \(indexOfStep - 1)", for: .normal)
            rightButton.setTitle("Шаг \(indexOfStep + 1)", for: .normal)
        } else {
            labelStep.text = "Шаг \(indexOfStep + 1) из 7"
            leftButton.setTitle("Шаг \(indexOfStep)", for: .normal)
            rightButton.setTitle("Шаг \(indexOfStep + 2)", for: .normal)
        }
    }
    
    func editButton(button: UIButton, x: Int) {
        button.frame = CGRect(x: x, y: 710, width: 100, height: 60)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Arial", size: 22.0)
        button.backgroundColor = UIColor(red: 0.7, green: 0, blue: 0, alpha: 0.7)
        button.layer.cornerRadius = 20
        
        view.addSubview(button)
    }
    
    func editLabel(label: UILabel) {
        label.frame = CGRect(x: 0, y: 160, width: Int(view.frame.width), height: 30)
        label.font = UIFont(name: "Arial", size: 25.0)
        label.textAlignment = .center
        
        view.addSubview(label)
    }
}
