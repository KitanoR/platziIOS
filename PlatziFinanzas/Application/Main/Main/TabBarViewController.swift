//
//  TabBarViewController.swift
//  PlatziFinanzas
//
//  Created by Cian Coders on 6/24/19.
//  Copyright © 2019 Cian Coders. All rights reserved.
//

import UIKit
import CircleMenu

class TabBarViewController: UITabBarController, CircleMenuDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtom()
        
        let widthView = view.bounds.width / 2 - 25
        let heigthView = tabBar.frame.origin.y - 50
        let button = CircleMenu(
            frame: CGRect(x: widthView, y: 50, width: 50, height: 50),
            normalIcon:"icon_menu",
            selectedIcon:"icon_close",
            buttonsCount: 4,
            duration: 0.01,
            distance: 120)
        button.backgroundColor = UIColor(named: "GreenColor")
        button.delegate = self
        
        button.layer.cornerRadius = button.frame.size.width / 2.0
   
        // Do any additional setup after loading the view.
       
        
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        print("ANTES DE LA ANIMACIÓN")
    }
    func menuOpened(_ circleMenu: CircleMenu) {
        print("MENÚ ABIERTO")
    }
    func menuCollapsed(_ circleMenu: CircleMenu) {
        
    }

    func customButtom(){
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = tabBar.frame.origin.y - 32
        menuButtonFrame.origin.x = view.bounds.width / 2 - menuButtonFrame.size.width / 2
        menuButton.frame = menuButtonFrame
        menuButton.setImage(UIImage(named: "PlusButton"), for: .normal)
        
        menuButton.backgroundColor = UIColor(named: "GreenColor")
        menuButton.layer.cornerRadius = 8
        view.addSubview(menuButton)
        
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    }
    @objc private func menuButtonAction(sender: UIButton){
        self.performSegue(withIdentifier: "goToModal", sender: self)
        //selectedIndex = 2
    }
}

