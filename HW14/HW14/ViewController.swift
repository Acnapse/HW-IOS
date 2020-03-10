import UIKit

class ViewController: UIViewController {

    let mainTextView = UITextView()
    
    let sizeSlider = UISlider()
    
    let fontsPicker = UIPickerView()
    
    let moodSwitch = UISwitch()
    
    let sunImageView = UIImageView()
    let moonImageView = UIImageView()
    let imagesArray = ["sun", "sun-2", "moon", "moon-2"]
    
    let smallStyleButton = UIButton()
    let bigStyleButton = UIButton()
    let firstButton = UIButton()
    let standartButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    let shareButton = UIButton()
    
    var backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
    var textColor: UIColor = UIColor.black
    var mainColor: UIColor = UIColor.black
    var size: CGFloat = 16.0
    let fontsArray = UIFont.familyNames
    var nameOfFont = "Arial"
    
    var activityView: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        addButton(button: firstButton, color: UIColor(red: 0.41, green: 0.35, blue: 0.8, alpha: 1), x: 20, y: 760)
        addButton(button: secondButton, color: UIColor(red:0.28, green:0.65, blue:0.42, alpha:1.0), x: 75, y: 760)
        addButton(button: thirdButton, color: UIColor(red:1.00, green:0.69, blue:0.18, alpha:1.0), x: 20, y: 815)
        addButton(button: fourthButton, color: UIColor(red:0.56, green:0.00, blue:0.13, alpha:1.0), x: 75, y: 815)
        addButton(button: standartButton, color: textColor, x: 125, y: 787)
        firstButton.addTarget(self, action: #selector(colorButtonIsPressed), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(colorButtonIsPressed), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(colorButtonIsPressed), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(colorButtonIsPressed), for: .touchUpInside)
        standartButton.addTarget(self, action: #selector(colorButtonIsPressed), for: .touchUpInside)
        
        addButton(button: smallStyleButton, text: "a", x: 270)
        addButton(button: bigStyleButton, text: "A", x: 340)
        smallStyleButton.addTarget(self, action: #selector(boldButtonIsPressed), for: .touchUpInside)
        bigStyleButton.addTarget(self, action: #selector(boldButtonIsPressed), for: .touchUpInside)
        
        addImageView(imageView: sunImageView, y: 760, image: imagesArray[1], size: 35)
        addImageView(imageView: moonImageView, y: 840, image: imagesArray[2], size: 25)
        
        shareButton.addTarget(self, action: #selector(shareButtonIsPressed), for: .touchUpInside)
                
        addButton()
        addSwitch()
        addPicker()
        addSlider()
        addTextView()
        
    }
    
    @objc func shareButtonIsPressed() {
        let shareText = "\(String(describing: mainTextView.text))"
        activityView = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityView!, animated: true, completion: nil)
    }
    
    @objc func boldButtonIsPressed(button: UIButton) {
        if button == bigStyleButton {
            mainTextView.text = mainTextView.text.uppercased()
        } else if button == smallStyleButton {
            mainTextView.text = mainTextView.text.lowercased()
        }
    }
    
    @objc func colorButtonIsPressed(button: UIButton) {
        textColor = button.backgroundColor!
        mainTextView.textColor = textColor
    }
    
    @objc func moodSwitchIsChanged() {
        if moodSwitch.isOn {
            backgroundColor = .black
            if textColor == .black {
                textColor = .white
            }
            mainColor = .white
            smallStyleButton.backgroundColor = .gray
            bigStyleButton.backgroundColor = .gray
            moonImageView.image = UIImage(named: imagesArray[3])
            sunImageView.image = UIImage(named: imagesArray[0])
            shareButton.frame = CGRect(x: 315, y: 820, width: 33, height: 36)
            shareButton.setImage(UIImage(named: "share-2"), for: .normal)
        } else {
            backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
            textColor = .black
            mainColor = .black
            smallStyleButton.backgroundColor = .lightGray
            bigStyleButton.backgroundColor = .lightGray
            moonImageView.image = UIImage(named: imagesArray[2])
            sunImageView.image = UIImage(named: imagesArray[1])
            shareButton.frame = CGRect(x: 315, y: 820, width: 30, height: 30)
            shareButton.setImage(UIImage(named: "share"), for: .normal)
        }
        smallStyleButton.setTitleColor(mainColor, for: .normal)
        bigStyleButton.setTitleColor(mainColor, for: .normal)
        standartButton.backgroundColor = mainColor
        fontsPicker.setValue(mainColor, forKey: "textColor")
        view.backgroundColor = backgroundColor
        mainTextView.textColor = textColor
    }
    
    @objc func sizeSliderIsChanged(sender: UISlider) {
        size = CGFloat(sender.value) * 32
        mainTextView.font = UIFont(name: nameOfFont, size: size)
    }
    
    fileprivate func addButton() {
        shareButton.frame = CGRect(x: 315, y: 820, width: 30, height: 30)
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        view.addSubview(shareButton)
    }
    
    fileprivate func addImageView(imageView: UIImageView, y: Int, image: String, size: Int) {
        imageView.frame = CGRect(x: 0, y: y, width: size, height: size)
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: image)
        view.addSubview(imageView)
    }
    
    fileprivate func addButton(button: UIButton, text: String, x: Int) {
        button.frame = CGRect(x: x, y: 760, width: 50, height: 50)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 23.0)
        button.setTitleColor(mainColor, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        view.addSubview(button)
    }
    
    fileprivate func addButton(button: UIButton, color: UIColor, x: Int, y: Int) {
        button.backgroundColor = color
        button.frame = CGRect(x: x, y: y, width: 40, height: 40)
        button.layer.cornerRadius = 20
        view.addSubview(button)
    }
    
    fileprivate func addSwitch() {
        moodSwitch.frame = CGRect(x: 0, y: 800, width: 0, height: 0)
        moodSwitch.center.x = view.center.x
        moodSwitch.isOn = false
        moodSwitch.addTarget(self, action: #selector(moodSwitchIsChanged), for: .valueChanged)
        view.addSubview(moodSwitch)
    }
    
    fileprivate func addPicker() {
        fontsPicker.dataSource = self
        fontsPicker.delegate = self
        
        fontsPicker.frame = CGRect(x: 0, y: 660, width: view.bounds.width - 100, height: 100)
        fontsPicker.center.x = view.center.x
        view.addSubview(fontsPicker)
    }
    
    fileprivate func addSlider() {
        sizeSlider.frame = CGRect(x: 0, y: 630, width: view.bounds.width - 100, height: 30)
        sizeSlider.center.x = view.center.x
        sizeSlider.value = 0.5
        sizeSlider.addTarget(self, action: #selector(sizeSliderIsChanged(sender:)), for: .valueChanged)
        view.addSubview(sizeSlider)
    }
    
    fileprivate func addTextView() {
        mainTextView.textColor = textColor
        mainTextView.textAlignment = .justified
        mainTextView.font = UIFont(name: nameOfFont, size: size)
        mainTextView.frame = CGRect(x: 0, y: 50, width: view.bounds.width - 20, height: 560)
        mainTextView.center.x = view.center.x
        mainTextView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        mainTextView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        mainTextView.text = "San Francisco, officially the City and County of San Francisco and colloquially known as SF, San Fran, Frisco, or The City, is the cultural, commercial, and financial center of Northern California. San Francisco is the 15th most populous city in the United States, and the fourth most populous in California, with 883,305 residents as of 2018. It covers an area of about 46.89 square miles (121.4 km2), mostly at the north end of the San Francisco Peninsula in the San Francisco Bay Area, making it the second most densely populated large U.S. city, and the fifth most densely populated U.S. county, behind only four of the five New York City boroughs. San Francisco is the 12th-largest metropolitan statistical area in the United States by population, with 4.7 million people, and the fourth-largest by economic output, with GDP of $549 billion in 2018. With San Jose, it forms the fifth most populous combined statistical area in the United States, the San Jose–San Francisco–Oakland, CA Combined Statistical Area (9.67 million residents in 2018). \n As of 2018, San Francisco was the seventh-highest-income county in the United States, with a per capita personal income of $130,696. In the same year, San Francisco proper had a GDP of $183.2 billion, and a GDP per capita of $207,371. The CSA San Francisco shares with San Jose and Oakland was the country's third-largest urban economy as of 2018, with a GDP of $1.03 trillion. Of the 500+ primary statistical areas in the U.S., this CSA had among the highest GDP per capita in 2018, at $106,757. San Francisco was ranked 12th in the world and 2nd in the United States on the Global Financial Centres Index as of September 2019. As of 2016, the San Francisco metropolitan area had the highest GDP per capita, labor productivity, and household income levels in the OECD. As of 2019, it is the highest rated American city on world liveability rankings.\n San Francisco was founded on June 29, 1776, when colonists from Spain established Presidio of San Francisco at the Golden Gate and Mission San Francisco de Asís a few miles away, all named for St. Francis of Assisi. The California Gold Rush of 1849 brought rapid growth, making it the largest city on the West Coast at the time. San Francisco became a consolidated city-county in 1856. San Francisco's status as the West Coast's largest city peaked between 1870 and 1900, when around 25% of California's population resided in the city proper. After three-quarters of the city was destroyed by the 1906 earthquake and fire, San Francisco was quickly rebuilt, hosting the Panama-Pacific International Exposition nine years later. In World War II, San Francisco was a major port of embarkation for service members shipping out to the Pacific Theater. It then became the birthplace of the United Nations in 1945. After the war, the confluence of returning servicemen, significant immigration, liberalizing attitudes, along with the rise of the \"hippie\" counterculture, the Sexual Revolution, the Peace Movement growing from opposition to United States involvement in the Vietnam War, and other factors led to the Summer of Love and the gay rights movement, cementing San Francisco as a center of liberal activism in the United States. Politically, the city votes strongly along liberal Democratic Party lines."
        view.addSubview(mainTextView)
    }

}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontsArray.count - 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameOfFont = fontsArray[row]
        mainTextView.font = UIFont(name: nameOfFont, size: size)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let rootView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 150))
        let textLabel = UILabel.init(frame: rootView.frame)
        textLabel.text = fontsArray[row]
        textLabel.textColor = mainColor
        textLabel.font = UIFont(name: fontsArray[row], size: 23.0)
        textLabel.textAlignment = .center
        rootView.addSubview(textLabel)
        return rootView
    }
    
}

