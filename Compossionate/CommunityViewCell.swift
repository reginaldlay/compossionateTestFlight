//
//  CommunityViewCell.swift
//  Compossionate
//
//  Created by Abhirama Rizkia Triadi on 24/06/22.
//

import UIKit

class CommunityViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    
    func setCommData(communityData : CommunityData){
        cellName.text = communityData.name
        cellDetail.text = communityData.avail
  //      cellImage.image = communityData.img
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
