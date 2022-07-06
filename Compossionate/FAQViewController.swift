//
//  FAQViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 22/06/22.
//

import UIKit

class FAQViewController: UIViewController {

    @IBOutlet weak var faqDesc1: UILabel!
    @IBOutlet weak var faqDesc2: UILabel!
    @IBOutlet weak var faqDesc3: UILabel!
    @IBOutlet weak var faqDesc4: UILabel!
    
    @IBOutlet weak var question1Lbl: UIButton!
    @IBOutlet weak var question2Lbl: UIButton!
    @IBOutlet weak var question3Lbl: UIButton!
    @IBOutlet weak var question4Lbl: UIButton!
    
    var question1Status = 0 //awal2 masih 0
    var question2Status = 0
    var question3Status = 0
    var question4Status = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        faqDesc1.text = "You can add more green materials or you can stir your compost to mix them well."
        faqDesc2.text = "MOL/EM4 is a group of effective microorganisms that function in the decomposition of organic compounds because they contain Azotobacter sp., Lactobacillus sp., yeast, photosynthetic bacteria and cellulose-decomposing fungi."
        faqDesc3.text = "The soil thermometer is used to measure the temperature and humidity of the soil so that the composting process can run optimally."
        faqDesc4.text = "By layering our compost, it will provide perfect environment for the organism to breakdown our waste. Also ensuring proportion of green and brown waste on the compost bin."
        
        faqDesc1.isHidden = true
        faqDesc2.isHidden = true
        faqDesc3.isHidden = true
        faqDesc4.isHidden = true
        
    }
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func question1Pressed(_ sender: Any) {
        if question1Status == 0 { //masih ketutup, mau dibuka
            question1Lbl.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            
            faqDesc1.isHidden = false
            
            question1Status = 1
        }
        else if question1Status == 1 { //udah kebuka, mau ditutup
            question1Lbl.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            
            faqDesc1.isHidden = true
            
            question1Status = 0
        }
    }

    @IBAction func question2Pressed(_ sender: Any) {
        if question2Status == 0 { //masih ketutup, mau dibuka
            question2Lbl.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            
            faqDesc2.isHidden = false
            
            question2Status = 1
        }
        else if question2Status == 1 { //udah kebuka, mau ditutup
            question2Lbl.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            
            faqDesc2.isHidden = true
            
            question2Status = 0
        }
    }
    
    @IBAction func question3Pressed(_ sender: Any) {
        if question3Status == 0 {
            question3Lbl.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            
            faqDesc3.isHidden = false
            
            question3Status = 1
        }
        else if question3Status == 1 {
            question3Lbl.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            
            faqDesc3.isHidden = true
            
            question3Status = 0
        }
    }
    
    @IBAction func question4Pressed(_ sender: Any) {
        if question4Status == 0 {
            question4Lbl.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            
            faqDesc4.isHidden = false
            
            question4Status = 1
        }
        else if question4Status == 1 {
            question4Lbl.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            
            faqDesc4.isHidden = true
            
            question4Status = 0
        }
    }
    
    
}
