//
//  CompostInfoViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 22/06/22.
//
//
//“Check if the compost were dry / wet” tiap 2 hari sekali
//“Turn / Mix your compost”  tiap 3 hari sekali (kelipatan 3)
//“Check for temperature (make sure to produce heat)” tiap 4 hari sekali
//“Give MOL/EM4 mixture to keep the compost moist” tiap 7 hari sekali
//

import UIKit

protocol RecieveFromCI {
    func passDataBack(data: Int)
}

class CompostInfoViewController: UIViewController {
    
    @IBOutlet weak var weeklyImage: UIImageView!
    @IBOutlet weak var weeklyDescription: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var checklistBox1: UIButton!
    @IBOutlet weak var checklistBox2: UIButton!
    @IBOutlet weak var checklistBox3: UIButton!
    
    @IBOutlet weak var toDoDescription1: UILabel!
    @IBOutlet weak var toDoDescription2: UILabel!
    @IBOutlet weak var toDoDescription3: UILabel!
    
    var delegate: RecieveFromCI?
    
    var dayCounter = 1
    var totalTask = 0
    var notifBatch = 0
    var checklistBox1Status = 0
    var checklistBox2Status = 0
    var checklistBox3Status = 0
    
    var toDoDescriptions: [String] = [
        "Check if the compost were dry / wet",
        "Turn / Mix your compost",
        "Make sure compost temperature is heat",
        "Give MOL/EM4 to keep the compost moist"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetTaskDaily()
        showImgDescWeekly()
        showLabelDaily()
        showTaskDaily()
    }
    
    func resetTaskDaily() {
        checklistBox1Status = 0
        checklistBox2Status = 0
        checklistBox3Status = 0
        
        checklistBox1.setImage(UIImage(systemName: "stop"), for: .normal)
        checklistBox2.setImage(UIImage(systemName: "stop"), for: .normal)
        checklistBox3.setImage(UIImage(systemName: "stop"), for: .normal)
        
        checklistBox1.isHidden = true
        checklistBox2.isHidden = true
        checklistBox3.isHidden = true
        toDoDescription1.isHidden = true
        toDoDescription2.isHidden = true
        toDoDescription3.isHidden = true
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        if (checklistBox1Status == 1 && totalTask == 1) ||
            ((checklistBox1Status == 1 && checklistBox2Status == 1) && totalTask == 2) ||
            ((checklistBox1Status == 1 && checklistBox2Status == 1 && checklistBox3Status == 1) && totalTask == 3) {
            notifBatch = 1
        }
        
        else {
            notifBatch = 0
        }
        
        delegate?.passDataBack(data: notifBatch)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leftPressed(_ sender: Any) {
        dayCounter -= 1
        
        resetTaskDaily()
        showImgDescWeekly()
        showLabelDaily()
        showTaskDaily()
    }
    
    @IBAction func rightPressed(_ sender: Any) {
        dayCounter += 1
        
        resetTaskDaily()
        showImgDescWeekly()
        showLabelDaily()
        showTaskDaily()
    }
    
    @IBAction func checklistBox1Pressed(_ sender: Any) {
        if checklistBox1Status == 0 {
            checklistBox1.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            
            checklistBox1Status = 1
        }
        else if checklistBox1Status == 1 {
            checklistBox1.setImage(UIImage(systemName: "stop"), for: .normal)
            
            checklistBox1Status = 0
        }
    }
    
    @IBAction func checklistBox2Pressed(_ sender: Any) {
        if checklistBox2Status == 0 {
            checklistBox2.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            
            checklistBox2Status = 1
        }
        else if checklistBox2Status == 1 {
            checklistBox2.setImage(UIImage(systemName: "stop"), for: .normal)
            
            checklistBox2Status = 0
        }
    }
    
    @IBAction func checklistBox3Pressed(_ sender: Any) {
        if checklistBox3Status == 0 {
            checklistBox3.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            
            checklistBox3Status = 1
        }
        else if checklistBox1Status == 1 {
            checklistBox3.setImage(UIImage(systemName: "stop"), for: .normal)
            
            checklistBox3Status = 0
        }
    }
    
//==========================================================================================
    
    func showCheckDesc1() {
        checklistBox1.isHidden = false
        toDoDescription1.isHidden = false
        
        totalTask = 1
    }
    
    func showCheckDesc2() {
        checklistBox1.isHidden = false
        checklistBox2.isHidden = false
        toDoDescription1.isHidden = false
        toDoDescription2.isHidden = false
        
        totalTask = 2
    }
    
    func showCheckDesc3() {
        checklistBox1.isHidden = false
        checklistBox2.isHidden = false
        checklistBox3.isHidden = false
        toDoDescription1.isHidden = false
        toDoDescription2.isHidden = false
        toDoDescription3.isHidden = false
        
        totalTask = 3
    }
    
    func showImgDescWeekly() {
        if dayCounter <= 7 {
            weeklyImage.image = UIImage(named: "CI_Week1")
            weeklyDescription.text = "Compost is the result of the decomposition of all the organic residues that we produce. When properly decomposed, compost will work to fertilize the soil."
        }
        
        else if dayCounter > 7 && dayCounter <= 14 {
            weeklyImage.image = UIImage(named: "CI_Week2")
            weeklyDescription.text = "The composting process is assisted by several organisms such as actinomycetes, bacteria, fungi, and others."
        }
        
        else if dayCounter > 14 && dayCounter <= 21 {
            weeklyImage.image = UIImage(named: "CI_Week3")
            weeklyDescription.text = "In making compost, there are four components that are needed, which are: Carbon (brown waste), Nitrogen (green waste), Water, and Oxygen."
        }
        
        else if dayCounter > 21 {
            weeklyImage.image = UIImage(named: "CI_Week4")
            weeklyDescription.text = "Congratulations! Your compost is ready to be harvested, or you can extend this journey and add more waste that you have."
        }
    }
    
    func showLabelDaily() {
        dayLabel.text = "Day \(dayCounter)"
        
        if dayCounter == 1 {
            leftButton.isHidden = true
        }
        
        else if dayCounter == 30{
            rightButton.isHidden = true
        }
        
        else {
            leftButton.isHidden = false
            rightButton.isHidden = false
        }
    }
    
    func showTaskDaily() {
        if dayCounter == 2 || dayCounter == 10 || dayCounter == 22 || dayCounter == 26 {
            toDoDescription1.text = toDoDescriptions[0]
            showCheckDesc1()
        }
        
        else if dayCounter == 3 || dayCounter == 9 || dayCounter == 15 || dayCounter == 27 {
            toDoDescription1.text = toDoDescriptions[1]
            showCheckDesc1()
        }
        
        else if dayCounter == 7 {
            toDoDescription1.text = toDoDescriptions[3]
            showCheckDesc1()
        }
        
        else if dayCounter == 6 || dayCounter == 18 || dayCounter == 30 {
            toDoDescription1.text = toDoDescriptions[0]
            toDoDescription2.text = toDoDescriptions[1]
            showCheckDesc2()
        }
        
        else if dayCounter == 4 || dayCounter == 8 || dayCounter == 16 || dayCounter == 20 {
            toDoDescription1.text = toDoDescriptions[0]
            toDoDescription2.text = toDoDescriptions[2]
            showCheckDesc2()
        }
        
        else if dayCounter == 14 {
            toDoDescription1.text = toDoDescriptions[0]
            toDoDescription2.text = toDoDescriptions[3]
            showCheckDesc2()
        }
        
        else if dayCounter == 21 {
            toDoDescription1.text = toDoDescriptions[1]
            toDoDescription2.text = toDoDescriptions[3]
            showCheckDesc2()
        }
        
        else if dayCounter == 12 || dayCounter == 24 {
            toDoDescription1.text = toDoDescriptions[0]
            toDoDescription2.text = toDoDescriptions[1]
            toDoDescription3.text = toDoDescriptions[2]
            showCheckDesc3()
        }
        
        else if dayCounter == 28 {
            toDoDescription1.text = toDoDescriptions[0]
            toDoDescription2.text = toDoDescriptions[2]
            toDoDescription3.text = toDoDescriptions[3]
            showCheckDesc3()
        }
        
        else {
            totalTask = 0
        }
        
    }
    
}
