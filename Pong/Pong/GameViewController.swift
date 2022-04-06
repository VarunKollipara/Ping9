//
//  GameViewController.swift
//  Pong
//
//  Created by 90310266 on 2/14/22.
//

import UIKit
import SpriteKit
import GameplayKit

var currentGameType = gameType.hard


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
               
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                //used to be .aspectFill
                //old aspect ratio used to be 750x1334, changed to fit my phone better
                //changed to 750x1617 (being changed)
                sceneNode.size = view.bounds.size
                
                
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
