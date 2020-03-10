//
//  PlayerSaveVC.swift
//  HW6.1
//
//  Created by Марина on 03.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class PlayerSaveVC: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.34, green: 0.37, blue: 0.81, alpha: 1)
        
        editLabel(label: label, text: "Игрок Создан!", x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.height), size: 50.0)
        
        view.addSubview(label)
    }

}
