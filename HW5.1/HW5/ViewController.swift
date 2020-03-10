import UIKit

class ViewController: UIViewController {
    
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    let dateTF = UITextField()
    let timeTF = UITextField()
    
    let date = UIDatePicker()
    let time = UIDatePicker()
    
    let button = UIButton()
    
    var str = "2017";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel(label: dateLabel, text: "Date:", x: 50, y: 70, size: 22.0, width: 100)
        editLabel(label: timeLabel, text: "Time:", x: 50, y: 110, size: 22.0, width: 100)
        
        editTF(textField: dateTF, text: "Date", x: 160, y: 70, size: 22.0, width: 250)
        editTF(textField: timeTF, text: "Time", x: 160, y: 110, size: 22.0, width: 250)
        
        date.frame = CGRect(x: 0, y: 220, width: Int(self.view.frame.width), height: 100)
        time.frame = CGRect(x: 0, y: 370, width: Int(self.view.frame.width), height: 100)
        
        button.frame = CGRect(x: 130, y: 570, width: 150, height: 100)
        button.backgroundColor = .brown
        button.setTitle("Check!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 30.0)
        button.layer.cornerRadius = 10
        
        date.datePickerMode = .date
        time.datePickerMode = .time
        
        date.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
        time.addTarget(self, action: #selector(timePickerChange(paramDatePicker:)), for: .valueChanged)
        button.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(dateLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(dateTF)
        self.view.addSubview(timeTF)
        self.view.addSubview(date)
        self.view.addSubview(time)
        self.view.addSubview(button)
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker) {
        if paramDatePicker.isEqual(self.date) {
            
            let dateFormatr = DateFormatter()
            dateFormatr.dateFormat = "dd-MM-yyyy"
            dateTF.text = dateFormatr.string(from: paramDatePicker.date)
            
            let visFormatr = DateFormatter()
            visFormatr.dateFormat = "yyyy"
            let year = Int(visFormatr.string(from: date.date))!
            if year % 4 == 0 {
                str = "Leap year"
            } else {
                str = "Non-leap year"
            }
        }
    }
    
    @objc func buttonIsPressed(sender: UIButton) {
        let segue = UIStoryboard(name: "Main", bundle: nil)
        guard let VC: DetailViewController = segue.instantiateViewController(withIdentifier: "detail") as? DetailViewController else {
                print("Couldn't instantiate View Controller with identifier")
                return
            }
        VC.text = str
        present(VC, animated: true, completion: nil)
    }
    
    @objc func timePickerChange(paramDatePicker: UIDatePicker) {
        if paramDatePicker.isEqual(self.time) {
            let dateFormatr = DateFormatter()
            dateFormatr.dateFormat = "h:mm a"
            timeTF.text = dateFormatr.string(from: paramDatePicker.date)
            
            let alertView = UIAlertController(title: "Time", message: timeTF.text, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in }
            alertView.addAction(action)
            self.present(alertView, animated: true) { }
        }
    }

    func editTF(textField: UITextField, text: String, x: Int, y: Int, size: CGFloat, width: Int) {
        textField.placeholder = text
        textField.font = UIFont(name: "Arial", size: size)
        textField.frame = CGRect(x: x, y: y, width: width, height: 40)
        textField.autocorrectionType = .no
    }

    func editLabel(label: UILabel, text: String, x: Int, y: Int, size: CGFloat, width: Int) {
        label.text = text
        label.font = UIFont(name: "Arial", size: size)
        label.frame = CGRect(x: x, y: y, width: width, height: 40)
    }
}

