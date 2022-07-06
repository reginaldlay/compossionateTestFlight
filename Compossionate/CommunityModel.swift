//
//  CommunityModel.swift
//  Compossionate
//
//  Created by Abhirama Rizkia Triadi on 24/06/22.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class CommunityData{
    var name: String?
    var avail: String?
    var address: String?
    let img: UIImage
    //var mapImg : UIImage
    var coordinate: CLLocationCoordinate2D
    
    init(img: UIImage, name:String,avail:String,address:String,coordinate:CLLocationCoordinate2D){
        self.name = name
        self.avail = avail
        self.address = address
       self.img = img
     //   self.mapImg = mapImg
        self.coordinate = coordinate
    }
}
