//
//  GuiMod3ViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 28/06/22.
//

import UIKit

class GuiMod3ViewController: UIViewController {

    var batchFromGuiMod2: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backPressed(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toGuiMod4", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guiMod4View = segue.destination as! GuiMod4ViewController
        
        guiMod4View.batchFromGuiMod3 = batchFromGuiMod2
    }

}
