//
//  MenuVC.swift
//  Pong
//
//  Created by 90310266 on 2/17/22.
//

import Foundation
import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case player2
}

class MenuVC : (UIViewController) {
    
    @IBAction func Player2( sender: Any) {
        moveToGame(game: .player2)
    }
    @IBAction func Easy( sender: Any) {
        moveToGame(game: .easy)
    }
    @IBAction func Medium( sender: Any) {
        moveToGame(game: .medium)
    }
    @IBAction func Hard( sender: Any) {
        moveToGame(game: .hard)
    }
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
        
        
    }
    
    
}
