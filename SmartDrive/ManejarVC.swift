//
//  ManejarVC.swift
//  SmartDrive
//
//  Created by Andres E Sedano on 2/24/16.
//  Copyright © 2016 Andres E Sedano. All rights reserved.
//

import UIKit
import iAd

class ManejarVC: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var botonManejar: UIButton!
    @IBOutlet weak var labelEstado: UILabel!
    @IBOutlet var vistaBackground: UIView!
    
    var manejando = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.canDisplayBannerAds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presionarBotonManejar(sender: AnyObject) {
        if manejando {
            labelEstado.text = "Empezar a manejar"
            vistaBackground.backgroundColor = UIColor.whiteColor()
            menuButton.enabled = true
            manejando = !manejando
            self.revealViewController().panGestureRecognizer().enabled = true
        } else {
            labelEstado.text = "Manejando"
            vistaBackground.backgroundColor = UIColor.grayColor()
            manejando = !manejando
            menuButton.enabled = false
            self.revealViewController().panGestureRecognizer().enabled = false
        }
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
