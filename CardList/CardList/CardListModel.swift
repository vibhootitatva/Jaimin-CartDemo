//
//  CardListModel.swift
//  CardList
//
//  Created by PCQ184 on 21/04/20.
//  Copyright © 2020 PCQ184. All rights reserved.
//

import Foundation
import UIKit
struct CardList {
    var title:String?
    var description:String?
    var price:String?
    var productimage:UIImage?
    
    init(title:String?,description:String?,price:String,productimage : UIImage) {
        self.title = title
        self.price = price
        self.description = description
        self.productimage = productimage
    }
    
}
