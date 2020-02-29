//
//  GameViewController.swift
//  MagicalMaze
//
//  Created by tallerapps on 23/10/18.
//  Copyright © 2018 tallerapps. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let SkView = self.view as! SKView
        SkView.showsFPS = false
        SkView.showsNodeCount = false
        SkView.ignoresSiblingOrder = false
        
        
        //Scene 1 (Pantalla De Inicio)
        let scene1 = pantallaDeInicio(size: CGSize(width: 2048, height: 1536))
        scene1.scaleMode = .aspectFill
        SkView.presentScene(scene1)
        
        
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
