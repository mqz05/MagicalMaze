//
//  Menu.swift
//  MagicalMaze
//
//  Created by tallerapps on 24/10/18.
//  Copyright © 2018 tallerapps. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class menu: SKScene {
    
    //
    // Declaraciones
    //
    
    // Botones
    let botonReady = SKSpriteNode(imageNamed: "READY")
    let panelNiveles = SKSpriteNode(imageNamed: "Panel De Niveles")
    let botonNivel1 = SKSpriteNode(imageNamed: "Nivel 1")
    let frameDelNivel = SKSpriteNode(imageNamed: "Frame de Niveles")
    
    // Video
    let videoDeFondo = SKVideoNode(fileNamed: "MagicalMaze.MP4")
    var reproductor = AVPlayer()
    
    // Audio
    let musicaDeFondoMenu: AVAudioPlayer? = {
        guard let urlMusica = Bundle.main.url(forResource: "Musica Menu", withExtension: "mp3") else {
            return nil
        }
        do {
            let reproductor = try AVAudioPlayer(contentsOf: urlMusica)
            reproductor.numberOfLoops = -1
            return reproductor
        } catch {
            return nil
        }
    }()
    
    
    override func didMove(to view: SKView) {
        
        // Video de Fondo
        let videoDeFondo:SKVideoNode? = {
            guard let urlNombre = Bundle.main.path(forResource: "MagicalMaze", ofType: "MP4") else {
                return nil
            }
            let url = URL(fileURLWithPath: urlNombre)
            let item = AVPlayerItem(url: url)
            reproductor = AVPlayer(playerItem: item)
            
            return SKVideoNode(avPlayer: reproductor)
        }()
        
        videoDeFondo?.position = CGPoint(x: frame.midX - 200, y: frame.midY)
        videoDeFondo?.setScale(2.15)
        videoDeFondo?.zPosition = 0
        addChild((videoDeFondo)!)
        
        reproductor.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: reproductor.currentItem, queue: nil)
        { notification in
            self.reproductor.seek(to: CMTime.zero)
            self.reproductor.play()
        }
        
        // Audio
        musicaDeFondoMenu?.play()
        
        
        // Botones
        botonReady.position = CGPoint(x: 3000, y: 3000)
        botonReady.size = CGSize(width: 425, height: 200)
        botonReady.zPosition = 1
        self.addChild(botonReady)
        
        
        panelNiveles.position = CGPoint(x: self.size.width / 2, y: 1300)
        panelNiveles.zPosition = 1
        self.addChild(panelNiveles)
        
        
        botonNivel1.position = CGPoint(x: self.size.width / 2, y: 1425)
        botonNivel1.zPosition = 2
        self.addChild(botonNivel1)
        
        
        frameDelNivel.position = CGPoint(x: 3000, y: 3000)
        frameDelNivel.zPosition = 3
        self.addChild(frameDelNivel)
    }
    
    
    // Touches Began
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let pulsar = touches.first as! UITouch
            let lugar = pulsar.location(in: self)
            let objeto = nodes(at: lugar)
            
            
            if objeto.contains(botonNivel1) {
                frameDelNivel.position = botonNivel1.position
                botonReady.position = CGPoint(x: self.size.width / 2, y: 150)
                
            } else if objeto.contains(botonReady) && frameDelNivel.position == botonNivel1.position {
                pasarANivel1()
            }
        }
    
    
    
    // Funcion para pasar de Pantalla
    func pasarANivel1() {
        if let scene3 = laberintoUno(fileNamed: "laberintoUno") {
            musicaDeFondoMenu?.stop()
            scene3.scaleMode = .aspectFill
            let transicion = SKTransition.crossFade(withDuration: 1.25)
            self.view!.presentScene(scene3,transition: transicion)
            
        }
    }
    
}


    
    
    
    

    


