//
//  Cell.swift
//  Extreme Sound Guesser
//
//  Created by Ty Victorson on 12/9/16.
//  Copyright © 2016 Xision. All rights reserved.
//

import UIKit

// NSCoding is a protocall that allows you to save data to the disk, write and read data.
class Cell: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
