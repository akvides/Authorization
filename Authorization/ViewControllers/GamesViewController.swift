//
//  GamesViewController.swift
//  Authorization
//
//  Created by Василий Полторак on 11.04.2022.
//

import UIKit

class GamesViewController: UIViewController {

    @IBOutlet var filterWeightButtons: [FilterButton]!
    @IBOutlet weak var gamesTableView: UITableView!
    
    private var boardGames = BoardGame.getBoardGames()
    
    private var countFilters = 0
    private var weights = [Weight]()
    
    private let enableImage = UIImage(systemName: "circle.inset.filled")
    private let disableImage = UIImage(systemName: "circle")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterWeightButtons[0].weight = .light
        filterWeightButtons[1].weight = .medium
        filterWeightButtons[2].weight = .hard
        
    }
    
    @IBAction func applyFilters(_ sender: FilterButton) {
        filteringGames(filter: sender)
    }
    
    private func filteringGames(filter: FilterButton) {
        
        guard let weight = filter.weight else { return }
        
        if !filter.enable {
            filter.setImage(enableImage, for: .normal)
            countFilters += 1
            
            if !weights.contains(weight) {
                weights.append(weight)
            }
            
        } else {
            filter.setImage(disableImage, for: .normal)
            countFilters -= 1
            
            for index in 0..<weights.count {
                if weights[index] == weight {
                    weights.remove(at: index)
                    break
                }
            }
        }
        
        filter.enable = !filter.enable
        
        if countFilters > 0 {
            updateGames(weight: weights)
        } else {
            updateGames(weight: [.light, .medium, .hard])
        }
        
    }
    
    
    private func updateGames(weight: [Weight]) {
        
        boardGames.removeAll()
        
        for game in BoardGame.getBoardGames() {
            if weight.contains(game.weight) {
                boardGames.append(game)
            }
        }
        
        gamesTableView.reloadData()
    }

}

extension GamesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        boardGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BoardGameTableViewCell
        
        let boardGame = boardGames[indexPath.row]
        
        if boardGame.image != "" {
            cell.gameImageView.image = UIImage(named: boardGame.image)
        } else {
            cell.gameImageView.image = UIImage(named: "empty image")
        }
        cell.gameNameLabel.text = boardGame.name
        cell.gameWeightLabel.text = "Сложность: \(boardGame.weight.rawValue)"
        cell.playingTimeLabel.text = "\(boardGame.playingTime) мин."
        
        return cell
    }
    
    
}
