//
//  Annotation.swift
//  Compossionate
//
//  Created by id on 27/06/22.
//

import Foundation
import MapKit

class Artwork: NSObject, MKAnnotation {

  let coordinate: CLLocationCoordinate2D

  init(

    coordinate: CLLocationCoordinate2D
  ) {

    self.coordinate = coordinate

    super.init()
  }

}

