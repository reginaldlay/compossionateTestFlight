//
//  ViewController.swift
//  Compossionate
//
//  Created by Reginald Lay on 14/06/22.
//

import UIKit

class CompostViewController: UIViewController, RecieveFromCI {
    
    func passDataBack(data: Int) {
        notifBatchFromCI = data
        checker()
    }
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var batchStatus: UILabel!
    
    var batch: Int = 0
    
    var notifBatchText = ""
    var notifBatchFromCI: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 143.24, height: 192)
        collectionView.collectionViewLayout = layout
        
        collectionView.register(BatchCollectionViewCell.nib(), forCellWithReuseIdentifier: BatchCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        if batch == 0 {
            batchStatus.isHidden = false
        }
        else {
            batchStatus.isHidden = true
        }
        
        checker()
    }
    
    @IBAction func addBatch(_ sender: Any) {
        self.performSegue(withIdentifier: "toGuiMod1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGuiMod1" {
            let guiMod1View = segue.destination as! GuiMod1ViewController
            
            guiMod1View.batchFromCompost = batch
        }
        else if segue.identifier == "toCompostInfo" { //buat lempar tanggal
            let compostInfoView = segue.destination as! CompostInfoViewController
            
            compostInfoView.delegate = self
        }
        
    }

    func checker() {
        if notifBatchFromCI == 0 {
            notifBatchText = "You have unfinished task"
        }
        else if notifBatchFromCI == 1 {
            notifBatchText = "You have no task left"
        }
        
        collectionView.reloadData()
    }
    
}

extension CompostViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "toCompostInfo", sender: nil)
    }
    
}

extension CompostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return batch
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BatchCollectionViewCell.identifier, for: indexPath) as! BatchCollectionViewCell
        
        
        for i in stride(from: 0, to: batch, by: 1) {
            cell.configureImage(with: UIImage(named: "Batch1")!)
            
            cell.configureLabel(with: "Batch \(i+1)", with: "", with: notifBatchText)
        }

        return cell
    }
    
}

extension CompostViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 143.24, height: 192)
    }
    
}
