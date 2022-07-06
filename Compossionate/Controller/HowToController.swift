//
//  HowToController.swift
//  Compossionate
//
//  Created by Abhirama Rizkia Triadi on 15/06/22.
//

import UIKit

class HowToController: UIViewController {

    //Outlet List
    @IBOutlet weak var ToolsImage: UIImageView!
    @IBOutlet weak var PrepareImage: UIImageView!
    @IBOutlet weak var PlaceImage: UIImageView!
    @IBOutlet weak var CheckImage: UIImageView!
    
    @IBOutlet weak var GreenInfo: UIButton!
    @IBOutlet weak var BrownInfo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image tools
        ToolsImage.image = UIImage(named: "ChooseM.png")
        PrepareImage.image = UIImage(named: "PrepareM.png")
        PlaceImage.image = UIImage(named: "PlaceM.png")
        CheckImage.image = UIImage(named: "checkS.png")
        
        
        
    }
    
    @IBAction func greenPressed(_ action: Any) {
        self.performSegue(withIdentifier: "toPopUpGreen", sender: nil)
    }
    
    @IBAction func brownPressed(_ action: Any) {
        self.performSegue(withIdentifier: "toPopUpBrown", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popUpHowToView = segue.destination as! PopUpHowToViewController
        
        if segue.identifier == "toPopUpGreen" {
            popUpHowToView.getFromHowTo = 0
        }
        
        else if segue.identifier == "toPopUpBrown" {
            popUpHowToView.getFromHowTo = 1
        }
    }

}

