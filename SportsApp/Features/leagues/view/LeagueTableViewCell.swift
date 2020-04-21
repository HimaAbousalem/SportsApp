//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueYoutube: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueBadge: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leagueBadge.layer.cornerRadius = leagueBadge.frame.width/2
        leagueBadge.clipsToBounds = true
        leagueBadge.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
