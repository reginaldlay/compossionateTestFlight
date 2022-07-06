//
//  CommunityDetailController.swift
//  Compossionate
//
//  Created by Abhirama Rizkia Triadi on 25/06/22.
//

import UIKit
import MapKit
import CoreLocation

class CommunityDetailController: UIViewController {

    @IBOutlet weak var detailMap: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var detailAvail: UILabel!
    @IBOutlet private var mapView: MKMapView!
    
    @IBAction func dismissModal(_ sender: Any) {
        self.dismiss(animated: true)
    }
    var community : CommunityData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let initialLocation = CLLocation(latitude: -6.412707, longitude: 111.719122)
        
        // Show artwork on map
        let artwork = Artwork(
    
          coordinate: CLLocationCoordinate2D(latitude: -8.409518, longitude: 115.188919))
        mapView.addAnnotation(artwork)

        
        detailName.text = community?.name
  //      detailMap.image = community?.mapImg
        detailAvail.text = community?.avail
        detailAddress.text = community?.address
        
    }
    
    @IBAction func callButton(_ sender: Any){
        if let url = URL(string: "tel://123456789012"){ //nomor abhi
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
            
            else {
                print("Can't open url on this device")
            }
        }
    }
    
}
