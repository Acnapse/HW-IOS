import UIKit

class DetailViewController: UIViewController {

    var text: String!
    let label = UILabel()
    
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        label.center = self.view.center
        label.font = UIFont(name: "Arial", size: 30.0)
        label.text = text
        
        button.setTitle("Back", for: .normal)
        button.frame = CGRect(x: 10, y: 50, width: 100, height: 40)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0)
        
        button.addTarget(self, action: #selector(backButtonIsPressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(button)
        self.view.addSubview(label)
    }
    
    @objc func backButtonIsPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
