//
//  GuiMod2ViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 28/06/22.
//

import UIKit

class GuiMod2ViewController: UIViewController {

    var batchFromGuiMod1: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backPressed(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any){
        self.performSegue(withIdentifier: "toGuiMod3", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGuiMod3" {
            let guiMod3View = segue.destination as! GuiMod3ViewController
            
            guiMod3View.batchFromGuiMod2 = batchFromGuiMod1
        }
    }

}
