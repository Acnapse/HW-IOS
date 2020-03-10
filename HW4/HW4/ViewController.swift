//
//  ViewController.swift
//  HW4
//
//  Created by Марина on 25.01.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    let backgroundImage = UIImageView(image: #imageLiteral(resourceName: "NY"))
    let header = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Растягиваем фон
        self.backgroundImage.frame = self.view.frame
        
        //Редактируем заголовок
        header.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: 110)
        header.textAlignment = .center
        header.text = "Real Estate Calculator"
        header.font = UIFont(name: "Times New Roman", size: 30.0)
        header.textColor = .gray
        header.backgroundColor = .white
        
        //Редактируем кнопку
        button.setTitle("Calculate a contract value", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        button.backgroundColor = .white
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22.0)
        self.button.center = self.view.center
        
        //Добавляем ссылку
        self.button.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchUpInside)
        
        self.view.addSubview(backgroundImage)
        self.view.addSubview(header)
        self.view.addSubview(button)
    }
    
    // Создаем функцию для перехода в DetailView
    @objc func buttonIsPressed(sender: UIButton) {
        self.performSegue(withIdentifier: "GoToCalculator", sender: nil)
    }
}


