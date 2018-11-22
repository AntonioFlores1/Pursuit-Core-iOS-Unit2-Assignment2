//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
     var GoT = GOTEpisode.allEpisodes
    
    var arrOfFilteredSeasons = [GOTEpisode.allEpisodes.filter{$0.season == 1},GOTEpisode.allEpisodes.filter{$0.season == 2}, GOTEpisode.allEpisodes.filter{$0.season == 3}, GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5}, GOTEpisode.allEpisodes.filter{$0.season == 6},GOTEpisode.allEpisodes.filter{$0.season == 7} ]
    
    override func viewDidLoad() {
    super.viewDidLoad()
    TableView.dataSource = self
    TableView.delegate = self
  }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailedViewController,
        let cellSelected = TableView.indexPathForSelectedRow else { return }
        let GotSelected = GoT[cellSelected.row]
        destination.Got = GotSelected
    }
    
    

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfFilteredSeasons[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //let soemthing = arrOfFilteredSeasons[indexPath.section]
       let Gots = arrOfFilteredSeasons[indexPath.section][indexPath.row]
        if Gots.season % 2 == 0 {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoTcell", for: indexPath) as? GoTCell else { return UITableViewCell() }
        cell.GotImage.image = UIImage(named: Gots.originalImageID)
        cell.GotLabel.text = Gots.name
        cell.GotLabel2.text = "S:\(Gots.season) E:\(Gots.number)"
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoTCell", for: indexPath) as? GoTCell else { return UITableViewCell() }
            cell.GotImage.image = UIImage(named: Gots.originalImageID)
            cell.GotLabel.text = Gots.name
            cell.GotLabel2.text = "S:\(Gots.season) E:\(Gots.number)"
            return cell
        }
    
    
  
    
}
    func numberOfSections(in tableView: UITableView) -> Int {
      return arrOfFilteredSeasons.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Season \((arrOfFilteredSeasons[section].first?.season)!)"
        
//        switch section  {
//        case 1:
//            return "Season 1"
//        case 2:
//            return "Season 2 "
//        case 3:
//            return "Season 3"
//        case 4 :
//            return "Season 4"
//        case 5 :
//            return "Season 5"
//        case 6 :
//            return "Season 6"
//        case 7:
//            return "Season 7"
//        default:
//            return "Not here"
//        }
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


