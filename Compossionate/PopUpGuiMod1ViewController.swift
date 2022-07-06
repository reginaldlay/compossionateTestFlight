//
//  PopUpGuiMod1ViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 27/06/22.
//

import UIKit

class PopUpGuiMod1ViewController: UIViewController {

    @IBOutlet weak var popUpImg: UIImageView!
    
    var getFromGuiMod1: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if getFromGuiMod1 == 0 {
            popUpImg.image = UIImage(named: "GreenPopUp")
        }
        else if getFromGuiMod1 == 1 {
            popUpImg.image = UIImage(named: "BrownPopUp")
        }
        
    }
    
    @IBAction func xPressed (_ sender: Any){
        dismiss(animated: true, completion: nil)
    }

}
