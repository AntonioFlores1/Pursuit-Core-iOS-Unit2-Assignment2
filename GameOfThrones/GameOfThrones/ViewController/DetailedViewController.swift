//
//  DetailedViewController.swift
//  GameOfThrones
//
//  Created by Pursuit on 11/17/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var DetailImage: UIImageView!
    
    @IBOutlet weak var DetailLabel: UILabel!
    
    @IBOutlet weak var DetailText: UITextView!
    
    @IBOutlet weak var everything: UILabel!
    
    var Got: GOTEpisode!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        DetailImage.image = UIImage(named: Got.mediumImageID)
        DetailLabel.text = Got.name
        DetailText.text = Got.summary
        everything.text = "Seaoson:\(Got.season) Epsidoe:\(Got.number) Runtime:\(Got.runtime) AirDate:\(Got.airdate) "
    }
    


}
