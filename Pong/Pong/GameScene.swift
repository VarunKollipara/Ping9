//
//  GameScene.swift
//  Pong
//
//  Created by 90310266 on 2/14/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var topLbl = SKLabelNode()
    var btmLbl = SKLabelNode()
    
    var score = [Int]()
    
    var rx = Int.random(in: 10...15)
    var ry = Int.random(in: 10...15)
    var rpx = Int.random(in: -200...200)
    
    enum currentMiniGame {
        case standard
        case hyperSpeed
    }
    
    var cmg = currentMiniGame.standard
    var rg = Int.random(in: 1...2)
    //random game mode
    

    
    override func didMove(to view: SKView) {
        
        
        
        topLbl = self.childNode(withName: "topLabel") as! SKLabelNode
        btmLbl = self.childNode(withName: "btmLabel") as! SKLabelNode
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height / 2) - 50
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height / 2) + 50
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        startGame()
        
    }
    
    func startGame() {
        score = [0,0]
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
    }
    
    func addScore(playerWhoWon : SKSpriteNode){
        
        ball.position = CGPoint(x: rpx, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        if rg == 1 {
            cmg = currentMiniGame.standard
        } else if rg == 2
        {
            cmg = currentMiniGame.hyperSpeed
        }
        
        if playerWhoWon == main {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: rx, dy: ry))
        }
        else if playerWhoWon == enemy {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -rx, dy: -ry))
        }
        
        topLbl.text = "\(score[1])"
        btmLbl.text = "\(score[0])"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentGameType == .player2 {
                if location.y > 0 {
                    
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                if location.y < 0 {
                    
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                
            }
            else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
            
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        switch currentGameType {
        case .easy:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
        case .medium:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.7))
            break
        case .hard:
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.2))
            break
        case .player2:
            
            break
        }
        
        rx = Int.random(in: 10...15)
        ry = Int.random(in: 10...15)
        rpx = Int.random(in: -200...200)
        rg = Int.random(in: 1...2)
        
        
        if ball.position.y <= main.position.y - 30 {
            addScore(playerWhoWon: enemy)
        }
        else if ball.position.y >= enemy.position.y + 30 {
            addScore(playerWhoWon: main)
        }
        
        /*switch cmg {
        case .standard:
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
            break
        case .hyperSpeed:
            ball.physicsBody?.applyImpulse(CGVector(dx: -2, dy: -2))
    
            break
            
        }*/
        
        
        
    }
}
