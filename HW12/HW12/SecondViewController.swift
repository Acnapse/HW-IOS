import UIKit

class SecondViewController: UIViewController {
    
    let colorArray = [UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.gray, UIColor.green, UIColor.lightGray, UIColor.orange, UIColor.purple, UIColor.red, UIColor.magenta, UIColor.white, UIColor.yellow]
    let stringColorArray = ["black", "blue", "brown", "cyan", "darkGray", "gray", "green", "lightGray", "orange", "purple", "red", "magenta", "white", "yellow"]
    
    let fontsArray = UIFont.familyNames
    var size :CGFloat = 20.0
    
    let textLabel = UILabel()
    let sizeLabel = UILabel()
    
    let sizeSlider = UISlider()
    
    let colorPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addText))
        self.view.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 1)
        
        addLabel(label: textLabel, text: "Change me)", x: 0, y: 90, width: Int(view.frame.width), height: 250)
        addLabel(label: sizeLabel, text: "Current Size: 25", x: 0, y: 350, width: Int(view.frame.width), height: 30)
        
        addSlider()
        
        colorPicker.frame = CGRect(x: 0, y: 420, width: Int(view.frame.width), height: 150)
        view.addSubview(colorPicker)
        
        colorPicker.delegate = self
        colorPicker.dataSource = self

    }
    
    @objc func refreshData() {
        textLabel.text = "Clear"
    }
    
    @objc func addText() {
        let alertController = UIAlertController(title: "Enter Text", message: "Label doesn't want to be empty", preferredStyle: .alert)
        alertController.addTextField { (textField) in}
        let alertAction = UIAlertAction(title: "Enter", style: .default) { (action) in
            self.textLabel.text = alertController.textFields?.first?.text
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func sizeSliderIsChanged (sender: UISlider) {
        size = CGFloat(sender.value) * 100
        sizeLabel.text = "Current Size: \(Int(size))"
        textLabel.font = UIFont.systemFont(ofSize: size)
    }
    
    fileprivate func addLabel(label: UILabel, text: String, x: Int, y: Int, width: Int, height: Int) {
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        label.textAlignment = .center
        label.text = text
        label.font = UIFont(name: "Times New Roman", size: size)
        
        view.addSubview(label)
    }
    
    fileprivate func addSlider() {
        sizeSlider.frame = CGRect(x: 50, y: 390, width: 300, height: 20)
        sizeSlider.minimumValue = 0.25
        sizeSlider.maximumValue = 2
        sizeSlider.addTarget(self, action: #selector(sizeSliderIsChanged), for: .valueChanged)
        view.addSubview(sizeSlider)
    }
    
}


extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 {
            return colorArray.count - 1
        } else {
            return fontsArray.count - 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 1 {
            textLabel.textColor = colorArray[row]
        } else {
            textLabel.font = UIFont(name: fontsArray[row], size: size)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 1 {
            return 100
        } else {
            return 250
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 1 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
            label.text = stringColorArray[row]
            label.textAlignment = .center
            label.textColor = colorArray[row]
            label.font = UIFont(name: "Times New Roman", size: 20.0)
            view.addSubview(label)
            return view
        } else {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
            label.text = fontsArray[row]
            label.textAlignment = .center
            label.font = UIFont(name: "Times New Roman", size: 20.0)
            
            view.addSubview(label)
            return view
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if component == 1 {
            let color = stringColorArray[row]
            return NSAttributedString(string: color, attributes: nil)
        } else {
            let font = fontsArray[row]
            return NSAttributedString(string: font, attributes: nil)
        }
    }
}
