//
//  RoundedImageView.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit
extension UIImageView{
    func  roundedImage()  {
        self.layer.cornerRadius =
            self.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.contentMode = .scaleAspectFill
        
    }
}
