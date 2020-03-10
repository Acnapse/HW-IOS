import UIKit

class ViewController: UIViewController {
    
    let headerLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    
    var sizeArray = ["25см", "30см", "35см"]
    var styleArray = ["Традиционное", "Тонкое"]
    
    var image = UIImageView()
    
    var thinArray = [UIImage(named: "thinL.png"),
                     UIImage(named: "thinM.png")]
    
    var traditionalArray = [UIImage(named: "traditionalL.png"),
                           UIImage(named: "traditionalM.png"),
                           UIImage(named: "traditionalS.png")]
    
    var sizeSC = UISegmentedControl()
    var styleSC = UISegmentedControl()
    
    let orderButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editLabel(label: headerLabel, text: "Дон Бекон", x: 50, y: 470, width: 150, height: 30, size: 25.0, textColor: .black, align: .left)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
        self.view.addSubview(headerLabel)
        
        editLabel(label: descriptionLabel, text: "Цыпленок, пикантная пепперони, томатный соус, красный лук, моцарелла, бекон", x: 50, y: 510, width: 330, height: 70, size: 18.0, textColor: .lightGray, align: .left)
        descriptionLabel.numberOfLines = 3
        self.view.addSubview(descriptionLabel)
        
        sizeSC = UISegmentedControl(items: sizeArray)
        editSC(segmentControl: sizeSC, y: 600)
        self.view.addSubview(sizeSC)
        
        styleSC = UISegmentedControl(items: styleArray)
        editSC(segmentControl: styleSC, y: 650)
        self.view.addSubview(styleSC)
        
        editLabel(label: priceLabel, text: "395 ₽", x: 50, y: 700, width: 115, height: 40, size: 30.0, textColor: .black, align: .center)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        self.view.addSubview(priceLabel)
        
        editButton(button: orderButton, text: "В корзину", x: 250, y: 700, width: 115, height: 40, size: 20.0)
        self.view.addSubview(orderButton)
        
        image.image = traditionalArray[2]
        image.frame = CGRect(x: 0, y: 150, width: 300, height: 300)
        image.center.x = view.center.x
        view.addSubview(image)
        
        sizeSC.addTarget(self, action: #selector(sizeSCIsChanged(_:)), for: .valueChanged)
        styleSC.addTarget(self, action: #selector(styleSCIsChanged(_:)), for: .valueChanged)
        orderButton.addTarget(self, action: #selector(orderButtonIsPressed(sender:)), for: .touchUpInside)
    }
    @objc func sizeSCIsChanged (_ sender: UISegmentedControl) {
        if sender == sizeSC && styleSC.selectedSegmentIndex == 0 {
            switch sender.selectedSegmentIndex {
            case 0:
                image.image = traditionalArray[2]
                priceLabel.text = "395 \u{20BD}"
            case 1:
                image.image = traditionalArray[1]
                priceLabel.text = "595 \u{20BD}"
            case 2:
                image.image = traditionalArray[0]
                priceLabel.text = "745 \u{20BD}"
            default:
                break
            }
        } else {
            switch sender.selectedSegmentIndex {
            case 0:
                styleSC.selectedSegmentIndex = 0
                image.image = traditionalArray[2]
                priceLabel.text = "395 \u{20BD}"
            case 1:
                image.image = thinArray[1]
                priceLabel.text = "595 \u{20BD}"
            case 2:
                image.image = thinArray[0]
                priceLabel.text = "745 \u{20BD}"
            default:
                break
            }
        }
    }
    @objc func styleSCIsChanged (_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            if sizeSC.selectedSegmentIndex == 1 {
                image.image = thinArray[1]
            }
            else if sizeSC.selectedSegmentIndex == 2 {
                image.image = thinArray[0]
            }
            else {
                sender.selectedSegmentIndex = 0
                image.image = traditionalArray[2]
            }
        } else {
            sizeSCIsChanged(sizeSC)
        }
    }
    @objc func orderButtonIsPressed (sender: UISegmentedControl) {
        let segue = UIStoryboard(name: "Main", bundle: nil)
        guard let VC: OrderVC = segue.instantiateViewController(withIdentifier: "order") as? OrderVC else {
            print("Couldn't instantiate View Controller with identifier")
            return
        }
        present(VC, animated: true, completion: nil)
    }
}

