//
//  CommunityController.swift
//  Compossionate
//
//  Created by Abhirama Rizkia Triadi on 24/06/22.
//

import UIKit
import CoreLocation



class CommunityController: UIViewController {

    var CommunityArray = [CommunityData]()
    
    func createArray(){
        let comm1 = CommunityData(img: UIImage(named: "paguyuban.png")!, name: "Maggot BSF Cibubur", avail: "Sell, Home Pickup, Share", address: "Jl. Kolonel Masturi No.107 KM.8 40511",coordinate: CLLocationCoordinate2D(latitude: -8.409518, longitude: 115.188919))
        CommunityArray.append(comm1)
        
        let comm2 = CommunityData(img: UIImage(named: "akademikompos.png")!,name: "Akademi Kompos", avail: "Home Pickup, Share",address: "Jl. Griya No.1, RT 008 RW 008, Petukangan Selatan, Kec. Pesanggrahan, Kota Jakarta Selatan", coordinate: CLLocationCoordinate2D(latitude: -6.2441197537362285, longitude:106.74723353832297))
        CommunityArray.append(comm2)
        
        let comm3 = CommunityData(img: UIImage(named: "akademikompos.png")!,name: "Koperasi Cipageran", avail: "Share", address: "Jl. Kolonel Masturi No.107 KM.8 40511",coordinate: CLLocationCoordinate2D(latitude: -8.409518, longitude: 115.188919))
        CommunityArray.append(comm3)
    }
    
    @IBOutlet weak var communityTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArray()
        communityTable.delegate = self
        communityTable.dataSource = self
        communityTable.separatorStyle = .none

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CommunityController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CommunityArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = communityTable.dequeueReusableCell(withIdentifier: "communityCell") as! CommunityViewCell
        
        cell.cellName.text = CommunityArray[indexPath.row].name
        cell.cellDetail.text = CommunityArray[indexPath.row].avail
        cell.cellImage.image = CommunityArray[indexPath.row].img
        
        cell.cellView.layer.cornerRadius = 15
        cell.cellView.layer.borderWidth = 3
        cell.cellView.layer.borderColor = UIColor.brown.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let detail = storyboard?.instantiateViewController(withIdentifier: "detailview") as? CommunityDetailController
//        detail?.dName = CommunityArray[indexPath.row].name
//        detail?.dAvail = CommunityArray[indexPath.row].avail
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CommunityDetailController{
            destination.community = CommunityArray[(communityTable.indexPathForSelectedRow?.row)!]
            communityTable.deselectRow(at: communityTable.indexPathForSelectedRow!, animated: true)
        }
    
    }
}
