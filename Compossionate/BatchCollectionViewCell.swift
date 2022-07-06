//
//  BatchCollectionViewCell.swift
//  Compossionate
//
//  Created by Reginald Lay on 27/06/22.
//

import UIKit

class BatchCollectionViewCell: UICollectionViewCell {

    @IBOutlet var batchImg: UIImageView!
    @IBOutlet var batchName: UILabel!
    @IBOutlet var batchDate: UILabel!
    @IBOutlet var batchNotif: UILabel!
    
    static let identifier = "BatchCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureImage(with image: UIImage) {
        batchImg.image = image
    }
    
    public func configureLabel(with labelName: String, with labelDate: String, with labelNotif: String) {
        batchName.text = labelName
        batchDate.text = labelDate
        batchNotif.text = labelNotif
    }

    static func nib() -> UINib {
        return UINib(nibName: "BatchCollectionViewCell", bundle: nil)
    }
    
}
