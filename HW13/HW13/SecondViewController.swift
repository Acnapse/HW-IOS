//
//  SecondViewController.swift
//  HW13
//
//  Created by Марина on 01.03.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label = UILabel()
    var login = UITextField()
    var pass = UITextField()
    var name = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabel(label: label, view: view, name: name.text!, login: login.text!, pass: pass.text!)
        addButton(view: view, button: loginButton, y: 600, text: "Continue", flag: 0)
        loginButton.addTarget(self, action: #selector(segueViewController), for: .touchUpInside)
    }
    
    @objc func segueViewController() {
        navigationController?.popViewController(animated: true)
        name.isHidden = true
    }

}
