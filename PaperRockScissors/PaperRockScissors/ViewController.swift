//
//  ViewController.swift
//  PaperRockScissors
//
//  Created by Марина on 21.01.2020.
//  Copyright © 2020 Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Sign: String {
        case paper = "✋"
        case rock = "👊"
        case scissors = "✌️"
    }
    
    enum Status {
        case win
        case draw
        case lose
    }
    
    func gameResult(comp: Sign, person: Sign) -> Status {
        switch person {
        case .paper:
            switch comp {
            case .paper:
                return .draw
            case .rock:
                return .win
            case .scissors:
                return .lose
            }
        case .rock :
            switch comp {
            case .paper:
                return .lose
            case .rock:
                return .draw
            case .scissors:
                return .win
            }
        case .scissors:
            switch comp {
            case .paper:
                return .win
            case .rock:
                return .lose
            case .scissors:
                return .draw
            }
        }
    }
    
    func computerSign() -> Sign? {
        let num = arc4random_uniform(3)
        switch num {
        case 0: return .paper
        case 1: return .rock
        case 2: return .scissors
        default: return nil
        }
    }

    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    
    var wins = 0;
    var loses = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateLabels() {
        winsLabel.text = "Total Wins: \(wins)"
        losesLabel.text = "Total Loses: \(loses)"
    }
    
    func play(sign: Sign) {
        
        let titleMes: String!
        guard let compSign = computerSign() else { return }
        let gameStatus = gameResult(comp: compSign, person: sign)
        
        switch gameStatus {
        case .win: titleMes = "🎉 You Won! 🎉\nCongratulation!"
        case .draw: titleMes = "Draw\nNo one wons."
        case .lose: titleMes = "😔 You lose 😔\nBetter luck next time"
        }
        
        let alertController = UIAlertController(title: titleMes, message:
            "(Computer)\n\(compSign.rawValue)\n|\n|\n|\n\(sign.rawValue)\n(You)",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController, animated: true) {
            switch gameStatus {
            case .win:
                self.wins += 1
                self.updateLabels()
            case .lose:
                self.loses += 1
                self.updateLabels()
            case .draw:
                return
            }
        }
        
    }

    // MARK: - IBActions
    @IBAction func paperButton(_ sender: UIButton) {
        if let buttonSign = sender.currentTitle {
            switch buttonSign {
            case "✋": play(sign: .paper)
            case "👊": play(sign: .rock)
            case "✌️": play(sign: .scissors)
            default: print("Error!")
            }
        }
    }
}

