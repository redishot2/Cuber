//
//  mainMenuVC.swift
//  Cuber
//
//  Created by Natasha Martinez on 8/23/17.
//  Copyright © 2017 natashamartinez. All rights reserved.
//

import UIKit

/*
 *  Colors
 *
 *  #ffffff white
 *  #171717 black
 *
 *  Color scheme 
 *  #2d3047 dark blue (grid bg)
 *  #f1e594 yellow
 *  #15adad light blue
 *  #f35f71 red
 *  #b68cb8 purple
 *  #ff6f59 orange
 *
 */

class MainMenuVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedPlay(_ sender: Any) {
        self.performSegue(withIdentifier: "goToGame", sender: nil)
    }
    
}
