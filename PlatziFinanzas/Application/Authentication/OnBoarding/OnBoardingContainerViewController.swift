//
//  OnBoardingContainerViewController.swift
//  PlatziFinanzas
//
//  Created by Cian Coders on 6/21/19.
//  Copyright © 2019 Cian Coders. All rights reserved.
//

import UIKit
import Firebase

class OnBoardingContainerViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnBoarding",
            let destination = segue.destination as? OnBoardingViewController else {
                return
        }
        Analytics.logEvent("next_slider", parameters: ["new_page": "Miau"])
        destination.pageControl = pageControl
    }
    @IBAction func buttonWasTapped(_ sender: UIButton){
        
        Analytics.logEvent("press_button_onboard", parameters: nil)
    }
    @IBAction func tapInsideButton(_ sender: Any) {
        print("heeey holaaaa=========>")
        Analytics.logEvent("press_button_onboard", parameters: nil)
    }
}
