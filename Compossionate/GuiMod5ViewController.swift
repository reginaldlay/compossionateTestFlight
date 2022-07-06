//
//  GuiMod5ViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 28/06/22.
//

import UIKit

class GuiMod5ViewController: UIViewController {

    var batchFromGuiMod4: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backPressed(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: Any){
        self.performSegue(withIdentifier: "toCompost", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCompost" {
            let compostView = segue.destination as! CompostViewController

            compostView.batch = batchFromGuiMod4 + 1
        }
    }

}
