//
//  VideoViewController.swift
//  HW11
//
//  Created by Марина on 13.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Здесь будет видео!"
        label.font = UIFont(name: "Arial", size: 30.0)
        label.center = view.center
        view.addSubview(label)
    }
}
