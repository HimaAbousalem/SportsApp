//
//  TeamsExtension.swift
//  SportsApp
//
//  Created by Esraa Hassan on 4/20/20.
//  Copyright © 2020 eman kamal. All rights reserved.
//

import Foundation
import UIKit

extension LeaguesDetailsViewController: TeamsViewDelegate{
    func setEmpty() {
        print("Hi")
    }
    
    
    func calculateTheTeamsCellSize(){
        if teamsFlowLayout == nil{
            let lineSpacing:CGFloat = 5
            let width = 120
            let height = 120
            teamsFlowLayout = UICollectionViewFlowLayout()
            teamsFlowLayout.itemSize = CGSize(width: width, height: height)
            teamsFlowLayout.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: lineSpacing, right: lineSpacing)
            teamsFlowLayout.scrollDirection = .horizontal
            teamsCollectionView.setCollectionViewLayout(teamsFlowLayout, animated: true)
            
        }
    }
    
    func setTeamsData(teams: [Team]) {
        self.teams =  teams
        self.teamsCollectionView.reloadData()
    }
}
