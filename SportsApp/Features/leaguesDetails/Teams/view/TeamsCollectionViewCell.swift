//
//  TeamsCollectionViewCell.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var teamImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        teamImage.layer.cornerRadius = teamImage.frame.width/2
        teamImage.clipsToBounds = true
        teamImage.backgroundColor = .black
    }

}
