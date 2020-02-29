//
//  PantallaDeInicio.swift
//  MagicalMaze
//
//  Created by tallerapps on 24/10/18.
//  Copyright © 2018 tallerapps. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class pantallaDeInicio: SKScene {
    
    var reproductor = AVPlayer()
    
    override func didMove(to view: SKView) {
        
        // Video
        let videoDeFondo:SKVideoNode? = {
            guard let urlNombre = Bundle.main.path(forResource: "PantallaDeCarga", ofType: "MP4") else {
                return nil
            }
            let url = URL(fileURLWithPath: urlNombre)
            let item = AVPlayerItem(url: url)
            reproductor = AVPlayer(playerItem: item)
            
            return SKVideoNode(avPlayer: reproductor)
        }()
        
        videoDeFondo?.position = CGPoint(x: frame.midX, y: frame.midY)
        videoDeFondo?.size = CGSize(width: 2048, height: 1548)
        addChild((videoDeFondo)!)
        
        reproductor.play()
        
        
        //Sonido
        self.run(SKAction.sequence([SKAction.run {self.run(SKAction.playSoundFileNamed("Sonido del Principio Real.mp3", waitForCompletion: false))}, SKAction.wait(forDuration: 3), SKAction.run {self.pasarDePantalla()}]))
    }
    
    
    func pasarDePantalla() {
        let gameScene2:menu = menu(size: CGSize(width: 2048, height: 1536))
        let transicion = SKTransition.fade(withDuration: 1)
        self.view!.presentScene(gameScene2,transition: transicion)
    }
}

