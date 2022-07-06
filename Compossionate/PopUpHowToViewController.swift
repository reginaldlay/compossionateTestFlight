//
//  PopUpHowToViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 06/07/22.
//

import UIKit

class PopUpHowToViewController: UIViewController {

    @IBOutlet weak var popUpImg: UIImageView!
    
    var getFromHowTo: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if getFromHowTo == 0 {
            popUpImg.image = UIImage(named: "GreenPopUp")
        }
        else if getFromHowTo == 1 {
            popUpImg.image = UIImage(named: "BrownPopUp")
        }
        
    }
    
    @IBAction func xPressed (_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
}
