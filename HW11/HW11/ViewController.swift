//
//  ViewController.swift
//  HW11
//
//  Created by Марина on 13.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let Image = UIImage(named: "cube")
    var ImageView = UIImageView()
    
    let headerLabel = UILabel()
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        setHeader()
        addButton()
    }
    
    fileprivate func addButton() {
        button.setTitle("Инструкция", for: .normal)
        button.frame = CGRect(x: 110, y: 620, width: 200, height: 60)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Arial", size: 22.0)
        button.backgroundColor = UIColor(red: 0.7, green: 0, blue: 0, alpha: 0.7)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(buttonIsPressed(_:)), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc func buttonIsPressed(_: UIButton) {
        let secVC = SecondViewController()
        navigationController?.pushViewController(secVC, animated: true)
    }
    
    fileprivate func setImage() {
        ImageView = UIImageView(image: Image)
        ImageView.center = view.center
        view.addSubview(ImageView)
    }
    
    fileprivate func setHeader() {
        headerLabel.text = "Как собрать Кубик Рубик?"
        headerLabel.frame = CGRect(x: 0, y: 220, width: Int(view.frame.width), height: 30)
        headerLabel.font = UIFont(name: "Arial", size: 25.0)
        headerLabel.textAlignment = .center
        view.addSubview(headerLabel)
    }

}

