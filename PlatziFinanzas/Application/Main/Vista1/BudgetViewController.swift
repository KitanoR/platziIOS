//
//  BudgetViewController.swift
//  PlatziFinanzas
//
//  Created by Andres Silva on 11/15/18.
//  Copyright © 2018 Platzi. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var animationsButtons: [UIButton]!
    
   
    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cell")
        
        if let navigationBar = self.navigationController?.navigationBar {
            let gradient = CAGradientLayer()
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            
            if let image = getImageFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
                navigationBar.barTintColor = UIColor(patternImage: image)
            }
        }
    }
    
    @IBAction func animateHeader(sender: UIButton) {
        animationLayout.constant = sender.frame.origin.x
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { (completed) in
            self.animationsButtons.forEach {
                $0.setTitleColor( UIColor(named: "TextColor") , for: .normal)
                sender.setTitleColor( UIColor.white , for: .normal)
            }
        }
    }
    
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
extension BudgetViewController: UITableViewDelegate {
    
}

extension BudgetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
