//
//  InfoViewController.swift
//  HW11
//
//  Created by Марина on 20.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: UIImage(named: "info_m"))
        imageView.frame = CGRect(x: 0, y: 90, width: Int(view.frame.width), height: 720)
        view.addSubview(imageView)
    }
}
