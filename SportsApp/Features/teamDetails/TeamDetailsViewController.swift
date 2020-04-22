//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by eman kamal on 4/21/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    @IBOutlet weak var teamStadiumLocation: UILabel!
    
    @IBOutlet weak var teamStadiumImg: UIImageView!
    @IBOutlet weak var teamStadium: UILabel!
    @IBOutlet weak var bk: UIImageView!
    
    @IBOutlet weak var teamYear: UILabel!
    
    @IBOutlet weak var teamDescription: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    
    @IBOutlet weak var teamCountry: UILabel!
    
    var team : Team?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTeamData()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        bk.isUserInteractionEnabled = true
        bk.addGestureRecognizer(tapGestureRecognizer)
    }
    func setUpTeamData(){
        teamName.text = team?.strTeam
        teamCountry.text = team?.strCountry
        teamYear.text = team?.intFormedYear
        teamImg.kf.setImage(with: URL(string: (team?.strTeamBadge)!), placeholder: UIImage(named: "noImagePlaceholder.png"))
        teamStadium.text = team?.strStadium
        teamStadiumLocation.text = team?.strStadiumLocation
        teamStadiumImg.kf.setImage(with: URL(string: (team?.strStadiumThumb)!), placeholder: UIImage(named: "noImagePlaceholder.png"))
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        performSegue(withIdentifier: "unWindToLeaguesDetails", sender: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
