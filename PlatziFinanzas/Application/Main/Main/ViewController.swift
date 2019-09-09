//
//  ViewController.swift
//  PlatziFinanzas
//
//  Created by Cian Coders on 6/20/19.
//  Copyright © 2019 Cian Coders. All rights reserved.
//

import UIKit
import XXXRoundMenuButton
import CircleMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = CircleMenu(
            frame: CGRect(x: 200, y: 200, width: 50, height: 50),
            normalIcon:"icon_menu",
            selectedIcon:"icon_close",
            buttonsCount: 4,
            duration: 4,
            distance: 120)
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        view.addSubview(button)
    }


}

