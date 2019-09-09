//
//  TransactionsViewController.swift
//  PlatziFinanzas
//
//  Created by Cian Coders on 6/24/19.
//  Copyright © 2019 Cian Coders. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var punteado: UITableView!
    @IBOutlet weak var otropunteado: UIView!
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView  else {
            return UIView()
        }
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        punteado.addDashedBorder()
      
        otropunteado.addDashedBorder3()
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cell")
        
//        let navController = navigationController!
//        let image = UIImage(named: "logo.pdf")
//        let imageView = UIImageView(image: image)
//
//        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
//        imageView.contentMode = .scaleAspectFit
//
//        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 100))
//
//        titleView.addSubview(imageView)
//        titleView.backgroundColor = .clear
//        self.navigationItem.titleView = titleView
        
        var titleView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        var titleImageView = UIImageView(image: UIImage(named: "logo"))
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = CGRect(x:0, y:0, width: titleView.frame.width, height: titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
        
        
        // Set the shadow color.
        navigationController?.navigationBar.shadowImage = UIColor.gray.as1ptImage()

        if let navFrame = self.navigationController?.navigationBar.frame {
            
            //HERE
            //Create a new frame with the default offset of the status bar
            let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
            
            let image = gradientWithFrametoImage(frame: newframe, colors: [UIColor.red.cgColor, UIColor.blue.cgColor])!
            
            self.navigationController?.navigationBar.barTintColor = UIColor(patternImage: image)
            
        }
//        tableView.delegate = self
//        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //Get current height of navigation bar when tableview/collectionview/scrollview did scroll
        guard let navBarHeight = navigationController?.navigationBar.frame.height else {
            return
        }
        
        //Compare with standard height of navigation bar.
        if navBarHeight > 44.0 {
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.barTintColor = .clear
            var titleView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
            var titleImageView = UIImageView(image: UIImage(named: "logo"))
            titleImageView.contentMode = .scaleAspectFit
            titleImageView.frame = CGRect(x:0, y:0, width: titleView.frame.width, height: titleView.frame.height)
            titleView.addSubview(titleImageView)
            navigationItem.titleView = titleView
        } else {
            self.navigationController?.navigationBar.shadowImage = nil
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            self.navigationController?.navigationBar.barTintColor = .green
            var titleView = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 30))
            var titleImageView = UIImageView(image: UIImage(named: "logo"))
            titleImageView.contentMode = .scaleAspectFit
            titleImageView.frame = CGRect(x:0, y:0, width: titleView.frame.width, height: titleView.frame.height)
            titleView.addSubview(titleImageView)
            navigationItem.titleView = titleView
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func gradientWithFrametoImage(frame: CGRect, colors: [CGColor]) -> UIImage? {
        let gradient: CAGradientLayer  = CAGradientLayer(layer: self.view.layer)
        gradient.frame = frame
        gradient.colors = colors
        UIGraphicsBeginImageContext(frame.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}

extension TransactionsViewController: UITableViewDelegate {
    
}

extension TransactionsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        tableView.backgroundView = count ==  0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
}
