//
//  ModalBotonesViewController.swift
//  PlatziFinanzas
//
//  Created by Cian Coders on 7/1/19.
//  Copyright © 2019 Cian Coders. All rights reserved.
//

import UIKit

class ModalBotonesViewController: UIViewController {

   
    @IBOutlet weak var boton1: UIButton!
    @IBOutlet weak var cerrar_boton: UIButton!
    @IBOutlet weak var boton2: UIButton!
    @IBOutlet weak var boton3: UIButton!
    @IBOutlet weak var boton4: UIButton!
    
    
    var cerrar_boton_center: CGPoint!
    var boton1_center: CGPoint!
    var boton2_center: CGPoint!
    var boton3_center: CGPoint!
    var boton4_center: CGPoint!
    
    var constraint_boton_cerrar: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        boton1_center = boton1.center
//        boton2_center = boton2.center
//        boton3_center = boton3.center
//        boton4_center = boton4.center
        
        let desplazamiento_principal = view.frame.height - cerrar_boton.frame.origin.y - 20
        
        
        for constraint in view.constraints{
            if constraint.identifier == "constrain_boton_cerrar" {
             constraint_boton_cerrar = constraint
            }
        }
        
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.025) {
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                if self.constraint_boton_cerrar != nil {
                    print("DEbe de animarse la traslación del botón cerrar")
                    self.constraint_boton_cerrar.constant = 60
                    self.view.layoutIfNeeded()
                    
                }
            })
            
                UIView.animate(withDuration: 0.2, delay: 0.25, options: [.curveEaseOut], animations: {
                    self.boton1.alpha = 1.0
                    self.boton1.frame.origin.y -= 30
                })
                UIView.animate(withDuration: 0.2, delay: 0.40, options: [.curveEaseOut], animations: {
                    self.boton4.alpha = 1.0
                    self.boton4.frame.origin.x += 30
                }, completion: nil)
                
                UIView.animate(withDuration: 0.2, delay: 0.50,  options: [.curveEaseOut], animations: {
                    self.boton3.alpha = 1.0
                    self.boton3.frame.origin.y += 30
                }, completion: nil)
                UIView.animate(withDuration: 0.2, delay: 0.60,  options: [.curveEaseOut], animations: {
                    self.boton2.alpha = 1.0
                    self.boton2.frame.origin.x -= 30
                }, completion: nil)
        }

        
        
    }
    
    
    @IBAction func cerrar_modal(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.boton4.alpha = 0.0
            self.boton1.alpha = 0.0
            self.boton2.alpha = 0.0
            self.boton3.alpha = 0.0
            
            self.boton1.frame.origin.y += 30
            self.boton4.frame.origin.x -= 30
            self.boton2.frame.origin.x += 30
            self.boton3.frame.origin.y -= 30
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // do stuff 42 seconds later
            self.dismiss(animated: true, completion: nil)
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

}
