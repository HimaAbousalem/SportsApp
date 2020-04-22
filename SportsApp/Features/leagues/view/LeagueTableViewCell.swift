//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by eman kamal on 4/18/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueBadge: UIImageView!
    var youtubeLink: String?
    var youtubeClosure: ((String)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        leagueBadge.layer.cornerRadius = leagueBadge.frame.width/2
        leagueBadge.clipsToBounds = true
        leagueBadge.backgroundColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func openYoutubLink(_ sender: UIButton) {
        let url = NSURL(string:"https://\(youtubeLink ?? "")")! as URL
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else{
            youtubeClosure!("There is no youtube link!")
        }
    }
}
