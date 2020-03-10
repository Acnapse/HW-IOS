//
//  ViewController.swift
//  HW12
//
//  Created by Марина on 21.02.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let headerLabel = UILabel()
    let continueLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.isUserInteractionEnabled = false
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeVC)))
        self.navigationController?.isNavigationBarHidden = true

        
        headerLabel.text = "Let's play with label"
        headerLabel.frame = CGRect(x: 50, y: 250, width: Int(view.frame.width), height: 400)
        headerLabel.font = UIFont(name: "Bradley Hand", size: 70.0)
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.shadowColor = .blue
        headerLabel.shadowOffset = CGSize(width: 2, height: 2)
        headerLabel.numberOfLines = 4
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.sizeToFit()
        view.addSubview(headerLabel)
        
        continueLabel.text = "Tap to continue"
        continueLabel.frame = CGRect(x: 0, y: 750, width: Int(view.frame.width), height: 100)
        continueLabel.font = UIFont(name: "Bradley Hand", size: 40.0)
        continueLabel.textAlignment = .center
        continueLabel.textColor = .blue
        view.addSubview(continueLabel)
        continueLabel.isHidden = true
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.continueLabel.isHidden = false
            self.view.isUserInteractionEnabled = true
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: .curveLinear, animations: { () -> Void in
                self.continueLabel.center = CGPoint(x: self.view.center.x, y: 620)
            }, completion: nil)

        }
        
        RunLoop.current.add(timer, forMode: .common)
    }

    @objc func changeVC () {
        let secVC = SecondViewController()
        navigationController?.pushViewController(secVC, animated: true)
    }

}

