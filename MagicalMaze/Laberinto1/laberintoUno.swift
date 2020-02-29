//
//  GameScene.swift
//  MagicalMaze
//
//  Created by tallerapps on 23/10/18.
//  Copyright © 2018 tallerapps. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation


//
// Estados Del Juego
//

enum estadoDelSabio {
    case movimiento, quieto, quietoAlPrincipio
}

enum estadoDelJuego {
    case enJuego, pausa, animacion, enAnimacion, animacionFinal
}

enum estadoDeLaAnimacion {
    case animacion1, animacion2, animacion3, animacion4, animacionDelAgua, sinAnimacion, animacionPluma, animacionLibro, animacionPizarra, animacionHierba, animacionCasiFinal, animacionCasiFinalSinObjetos, animacionFinal1, animacionFinal2, animacionFinalAcabada
}

enum estadoUpdateAgua {
    case ejecutado, sinEjecutar, sinEjecutarAlPrincipio
}

enum estadoUpdateAnimaciones {
    case ejecutado, sinEjecutar, sinEjecutarAlPrincipio
}

enum estadoAnimacionCasiFinal {
    case ejecutado, sinEjecutar, sinEjecutarAlPrincipio
}

enum estadoAnimacionFinal {
    case ejecutado, sinEjecutar, sinEjecutarAlPrincipio
}



//
//
// Class
//
//

class laberintoUno: SKScene, SKPhysicsContactDelegate {
    
    //
    // Declaraciones
    //
    
    // Personajes
    var sabio: SKSpriteNode!
    var posicionSabio: CGPoint!
    
    var robotRK378: SKSpriteNode!
    
    var sekilin: SKSpriteNode!
    
    
    // Portales
    var portalUnoUno: SKSpriteNode!
    var sitioDeTeletransporte1 = CGPoint(x: -2725, y: -7070)
    var teletransporte1: SKAction!
    
    var portalUnoDos: SKSpriteNode!
    var sitioDeTeletransporte2 = CGPoint(x: 7500, y: -150)
    var teletransporte2: SKAction!
    
    var portalDosUno: SKSpriteNode!
    var sitioDeTeletransporte3 = CGPoint(x: -11000, y: -5240)
    var teletransporte3: SKAction!
    
    var portalDosDos: SKSpriteNode!
    var sitioDeTeletransporte4 = CGPoint(x: 7555, y: -8475)
    var teletransporte4: SKAction!
    
    var portalTresUno: SKSpriteNode!
    var sitioDeTeletransporte5 = CGPoint(x: -11500, y: 8050)
    var teletransporte5: SKAction!
    
    var portalTresDos: SKSpriteNode!
    var sitioDeTeletransporte6 = CGPoint(x: -7500, y: -9000)
    var teletransporte6: SKAction!
    
    var portalCuatroUno: SKSpriteNode!
    var sitioDeTeletransporte7 = CGPoint(x: 11570, y: 8820)
    var teletransporte7: SKAction!
    
    
    // Menu Pause
    var panelDePause: SKSpriteNode!
    
    var botonPause: SKSpriteNode!
    var botonVolverAlMenu: SKSpriteNode!
    var botonReanudar: SKSpriteNode!
    
    
    // Animaciones
    var sabioDeAnimaciones: SKSpriteNode!
    var filtroDeAnimaciones: SKSpriteNode!
    
    var textoSekilin: SKSpriteNode!
    
    var texto1: SKSpriteNode!
    var texto2: SKSpriteNode!
    var texto3: SKSpriteNode!
    var texto4: SKSpriteNode!
    var textoDelAgua: SKSpriteNode!
    
    var textoPluma: SKSpriteNode!
    var textoLibro: SKSpriteNode!
    var textoPizarra: SKSpriteNode!
    var textoHierbaAmarilla: SKSpriteNode!
    var textoFinal: SKSpriteNode!
    var textoCasiFinal: SKSpriteNode!
    var textoFinalSinObjetos: SKSpriteNode!
    
    var mensajeFinal: SKSpriteNode!
    
    
    // Objetos
    var inventario: SKSpriteNode!
    
    var rocas1: SKSpriteNode!
    var rocas2: SKSpriteNode!
    var rocas3: SKSpriteNode!
    
    var plumaTinta: SKSpriteNode!
    var libro: SKSpriteNode!
    var pizarraTiza: SKSpriteNode!
    
    var plumaTintaAnimacion: SKSpriteNode!
    var libroAnimacion: SKSpriteNode!
    var pizarraTizaAnimacion: SKSpriteNode!
    
    var plumaTintaOpacidad: SKSpriteNode!
    var libroOpacidad: SKSpriteNode!
    var pizarraTizaOpacidad: SKSpriteNode!
    
    var iPad: SKSpriteNode!
    
    var plumaTintaConseguida = false
    var libroConseguido = false
    var pizarraTizaConseguida = false
    
    
    // Acciones
    var accionMoverse: SKAction!
    var animacionMovimiento = SKAction.init(named: "sabioMovimiento")
    var animacionMovimiento2 = SKAction.init(named: "sabioMovimiento2")
    
    var secuenciaReducirDeseparecer: SKAction!
    
    var moverPlumaTinta: SKAction!
    var cambiarDeTexturaPlumaTinta: SKAction!
    var secuenciaColocarsePlumaTinta: SKAction!
    
    var moverLibro: SKAction!
    var cambiarDeTexturaLibro: SKAction!
    var secuenciaColocarseLibro: SKAction!
    
    var moverPizarra: SKAction!
    var cambiarDeTexturaPizarra: SKAction!
    var secuenciaColocarsePizarra: SKAction!
    
    var accionDeReducir = SKAction.resize(toWidth: 1, height: 1, duration: 0.5)
    var accionDeAumentarIpad = SKAction.resize(toWidth: 571.9, height: 883.5, duration: 2)
    var accionDeAumentarMensajeFinal = SKAction.resize(toWidth: 2100, height: 1050, duration: 2.25)
    var quitar = SKAction.removeFromParent()
    
    var esperar1 = SKAction.wait(forDuration: 1)
    var esperar2 = SKAction.wait(forDuration: 0.5)
    var esperar3 = SKAction.wait(forDuration: 0.75)
    
    var esconder = SKAction.hide()
    var enseñar = SKAction.unhide()
    
    var cambioSabioAnimacion: SKAction!
    
    
    // Varios
    var fondoLaberinto: SKTileMapNode!
    
    var hierbaTile: SKTileDefinition!
    var hierbaTile2: SKTileDefinition!
    
    var fondoFinal: SKSpriteNode!
    
    var columnaSabio: Int!
    var filaSabio: Int!
    var tileSabio: SKTileDefinition!
    
    var hierbaAmarilla1: SKSpriteNode!
    var hierbaAmarilla2: SKSpriteNode!
    var lago3: SKReferenceNode!
    var lago4: SKReferenceNode!
    
    var localizacionDelToque: CGPoint!
    var localizacionDelToqueParaFlecha: CGPoint!
    var primeraPulsacion: UITouch!
    var flechaDelToque = SKSpriteNode(imageNamed: "Flecha del Toque")
    
    var tile1: SKTileDefinition!
    
    var objeto: [SKNode]!
    
    
    // Musica de Fondo
    let musicaDeFondo: AVAudioPlayer? = {
        guard let urlMusica = Bundle.main.url(forResource: "Musica de Fondo Laberinto 1", withExtension: "mp3") else {
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
    
    
    // Estados Del Juego
    var estadoActual: estadoDelJuego = .animacion
    var estadoEnLaAnimacion: estadoDeLaAnimacion = .animacion1
    var estadoSabio: estadoDelSabio = .quietoAlPrincipio
    var estadoDelUpdateAgua: estadoUpdateAgua = .sinEjecutarAlPrincipio
    var estadoDelUpdateAnimaciones: estadoUpdateAnimaciones = .sinEjecutarAlPrincipio
    var estadoDeAnimacionCasiFinal: estadoAnimacionCasiFinal = .sinEjecutarAlPrincipio
    var estadoDeAnimacionFinal: estadoAnimacionFinal = .sinEjecutarAlPrincipio
    
    
    
    //
    // MARK: Did Move
    //
    
    override func didMove(to view: SKView) {
        
        //Robot
        sabio = childNode(withName: "Sabio") as? SKSpriteNode
        sabio.name = "sabio"
        
        robotRK378 = childNode(withName: "RobotRK378") as? SKSpriteNode
        
        sekilin = childNode(withName: "Sekilin") as? SKSpriteNode

        // Portales
        portalUnoUno = childNode(withName: "portalUnoUno") as? SKSpriteNode
        portalUnoUno.name = "portalUnoUno"
        
        portalUnoDos = childNode(withName: "portalUnoDos") as? SKSpriteNode
        portalUnoDos.name = "portalUnoDos"
        
        portalDosUno = childNode(withName: "portalDosUno") as? SKSpriteNode
        portalDosUno.name = "portalDosUno"
        
        portalDosDos = childNode(withName: "portalDosDos") as? SKSpriteNode
        portalDosDos.name = "portalDosDos"
        
        portalTresUno = childNode(withName: "portalTresUno") as? SKSpriteNode
        portalTresUno.name = "portalTresUno"
        
        portalTresDos = childNode(withName: "portalTresDos") as? SKSpriteNode
        portalTresDos.name = "portalTresDos"
        
        portalCuatroUno = childNode(withName: "portalCuatroUno") as? SKSpriteNode
        portalCuatroUno.name = "portalCuatroUno"
 
        
        // Menu Pause
        botonPause = sabio.childNode(withName: "botonDePause") as? SKSpriteNode
        
        panelDePause = sabio.childNode(withName: "panelDePause") as? SKSpriteNode
        panelDePause.position = CGPoint(x: 0, y: 20000)
        
        botonVolverAlMenu = panelDePause.childNode(withName: "botonDeVueltaAlMenu") as? SKSpriteNode
        
        botonReanudar = panelDePause.childNode(withName: "botonDeReanudar") as? SKSpriteNode
        
        
        // Animaciones
        filtroDeAnimaciones = childNode(withName: "filtroAnimaciones") as? SKSpriteNode
        sabioDeAnimaciones = childNode(withName: "SabioAnimaciones") as? SKSpriteNode
        
        textoSekilin = childNode(withName: "Texto Sekilin") as? SKSpriteNode
        
        texto1 = childNode(withName: "Texto1") as? SKSpriteNode
        texto2 = childNode(withName: "Texto2") as? SKSpriteNode
        texto3 = childNode(withName: "Texto3") as? SKSpriteNode
        texto4 = childNode(withName: "Texto4") as? SKSpriteNode
        
        textoDelAgua = sabio.childNode(withName: "textoDelAgua") as? SKSpriteNode
        textoDelAgua.position = CGPoint(x: 0, y: 20000)
        
        textoPluma = SKSpriteNode(imageNamed: "Texto Pluma")
        textoPluma.zPosition = 10
        textoPluma.position = CGPoint(x: 20000, y: 20000)
        textoPluma.size = CGSize(width: 1915, height: 1260)
        self.addChild(textoPluma)
        
        textoLibro = SKSpriteNode(imageNamed: "Texto Libro")
        textoLibro.zPosition = 10
        textoLibro.position = CGPoint(x: 20000, y: 20000)
        textoLibro.size = CGSize(width: 1915, height: 1260)
        self.addChild(textoLibro)
        
        textoPizarra = SKSpriteNode(imageNamed: "Texto Pizarra")
        textoPizarra.zPosition = 10
        textoPizarra.position = CGPoint(x: 20000, y: 20000)
        textoPizarra.size = CGSize(width: 1915, height: 1260)
        self.addChild(textoPizarra)
        
        textoHierbaAmarilla = SKSpriteNode(imageNamed: "Texto Hierba Amarilla")
        textoHierbaAmarilla.zPosition = 10
        textoHierbaAmarilla.position = CGPoint(x: 20000, y: 20000)
        textoHierbaAmarilla.size = CGSize(width: 1835, height: 970)
        self.addChild(textoHierbaAmarilla)
        
        textoFinal = SKSpriteNode(imageNamed: "Texto Final")
        textoFinal.zPosition = 10
        textoFinal.position = CGPoint(x: 20000, y: 20000)
        textoFinal.size = CGSize(width: 1915, height: 1260)
        self.addChild(textoFinal)
        
        textoCasiFinal = SKSpriteNode(imageNamed: "Texto Casi Final")
        textoCasiFinal.zPosition = 10
        textoCasiFinal.position = CGPoint(x: 20000, y: 20000)
        textoCasiFinal.size = CGSize(width: 1915, height: 1260)
        self.addChild(textoCasiFinal)
        
        textoFinalSinObjetos = SKSpriteNode(imageNamed: "Texto Final Sin Objetos")
        textoFinalSinObjetos.zPosition = 10
        textoFinalSinObjetos.position = CGPoint(x: 20000, y: 20000)
        textoFinalSinObjetos.size = CGSize(width: 1830, height: 965)
        self.addChild(textoFinalSinObjetos)
        
        mensajeFinal = SKSpriteNode(imageNamed: "Mensaje Final")
        mensajeFinal.zPosition = 20
        mensajeFinal.position = CGPoint(x: 0, y: 20000)
        mensajeFinal.size = CGSize(width: 0, height: 0)
        self.addChild(mensajeFinal)
        
        
        // Objetos
        inventario = sabio.childNode(withName: "Inventario") as? SKSpriteNode
        
        rocas1 = childNode(withName: "rocas1") as? SKSpriteNode
        rocas2 = childNode(withName: "rocas2") as? SKSpriteNode
        rocas3 = childNode(withName: "rocas3") as? SKSpriteNode
        
        plumaTinta = SKSpriteNode(imageNamed: "Pluma y Tinta")
        plumaTinta.position = CGPoint(x: rocas1.position.x, y: rocas1.position.y)
        plumaTinta.size = CGSize(width: 500, height: 625)
        plumaTinta.zPosition = 10
        plumaTinta.run(esconder)
        self.addChild(plumaTinta)
        
        plumaTintaOpacidad = inventario.childNode(withName: "Pluma y Tinta opacidad") as? SKSpriteNode
        
        plumaTintaAnimacion = SKSpriteNode(imageNamed: "Pluma y Tinta")
        plumaTintaAnimacion.position = CGPoint(x: robotRK378.position.x - 150, y: robotRK378.position.y - 75)
        plumaTintaAnimacion.size = CGSize(width: 0, height: 0)
        plumaTintaAnimacion.zPosition = 10
        self.addChild(plumaTintaAnimacion)
        
        libro = SKSpriteNode(imageNamed: "Libro")
        libro.position = CGPoint(x: rocas2.position.x, y: rocas2.position.y)
        libro.size = CGSize(width: 565, height: 441.2)
        libro.zPosition = 10
        libro.run(esconder)
        self.addChild(libro)
        
        libroOpacidad = inventario.childNode(withName: "Libro opacidad") as? SKSpriteNode
        
        libroAnimacion = SKSpriteNode(imageNamed: "Libro")
        libroAnimacion.position = CGPoint(x: robotRK378.position.x, y: robotRK378.position.y - 100)
        libroAnimacion.size = CGSize(width: 0, height: 0)
        libroAnimacion.zPosition = 10
        self.addChild(libroAnimacion)
        
        pizarraTiza = SKSpriteNode(imageNamed: "Pizarra y Tiza")
        pizarraTiza.position = CGPoint(x: rocas3.position.x, y: rocas3.position.y)
        pizarraTiza.size = CGSize(width: 525, height: 346.2)
        pizarraTiza.zPosition = 10
        pizarraTiza.run(esconder)
        self.addChild(pizarraTiza)
        
        pizarraTizaOpacidad = inventario.childNode(withName: "Pizarra y Tiza opacidad") as? SKSpriteNode
        
        pizarraTizaAnimacion = SKSpriteNode(imageNamed: "Pizarra y Tiza")
        pizarraTizaAnimacion.position = CGPoint(x: robotRK378.position.x + 150, y: robotRK378.position.y - 75)
        pizarraTizaAnimacion.size = CGSize(width: 0, height: 0)
        pizarraTizaAnimacion.zPosition = 9
        self.addChild(pizarraTizaAnimacion)
        
        iPad = SKSpriteNode(imageNamed: "iPad")
        iPad.zPosition = 20
        iPad.size = CGSize(width: 0, height: 0)
        iPad.position = robotRK378.position
        self.addChild(iPad)

        
        // Varios
        fondoLaberinto = childNode(withName: "fondoHierba") as? SKTileMapNode
        fondoLaberinto.name = "fondoLaberinto"
        
        hierbaTile = fondoLaberinto.tileDefinition(atColumn: 30, row: 16)
        
        hierbaTile2 = fondoLaberinto.tileDefinition(atColumn: 35, row: 4)
        
        fondoFinal = childNode(withName: "fondoFinal") as? SKSpriteNode
        
        lago3 = childNode(withName: "lago3") as? SKReferenceNode
        lago4 = childNode(withName: "lago4") as? SKReferenceNode
        
        flechaDelToque.position = CGPoint(x: 20000, y: 20000)
        flechaDelToque.size = CGSize(width: 300, height: 300)
        flechaDelToque.zPosition = 5
        self.addChild(flechaDelToque)
        
        secuenciaReducirDeseparecer = SKAction.sequence([accionDeReducir, esperar2, quitar])
        
        // Audio
        musicaDeFondo?.play()
            
        // Physics
        physicsWorld.contactDelegate = self
    }

    
    //
    // MARK: Touches Began
    //
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches{
            
            if estadoActual == .enJuego {
                
            // Posicion Del Toque
            localizacionDelToque = touches.first?.location(in: self)
            
            let column1 = fondoLaberinto.tileColumnIndex(fromPosition: localizacionDelToque)
            let row1 = fondoLaberinto.tileRowIndex(fromPosition: localizacionDelToque)
            tile1 = fondoLaberinto.tileDefinition(atColumn: column1, row: row1)
                
        }
            primeraPulsacion = touches.first
            let lugar = primeraPulsacion.location(in: self)
            objeto = nodes(at: lugar)
            
            
            //                    //
            // HYPER IF STATEMENT //
            //                    //
            
            if estadoActual == .animacion && (estadoEnLaAnimacion == .animacion1 || estadoEnLaAnimacion == .animacion2 || estadoEnLaAnimacion == .animacion3 || estadoEnLaAnimacion == .animacion4) {
                pasarDeAnimacion1()
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionPluma {
                estadoActual = .enJuego
                estadoEnLaAnimacion = .sinAnimacion
                estadoSabio = .quieto
                textoPluma.removeFromParent()
                
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionHierba {
                estadoActual = .enJuego
                estadoEnLaAnimacion = .sinAnimacion
                estadoSabio = .quieto
                textoHierbaAmarilla.position = CGPoint(x: 20000, y: 20000)
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionLibro {
                estadoActual = .enJuego
                estadoEnLaAnimacion = .sinAnimacion
                estadoSabio = .quieto
                textoLibro.removeFromParent()
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionPizarra {
                estadoActual = .enJuego
                estadoEnLaAnimacion = .sinAnimacion
                estadoSabio = .quieto
                textoPizarra.removeFromParent()
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionCasiFinal {
                estadoActual = .enJuego
                estadoEnLaAnimacion = .sinAnimacion
                estadoSabio = .quieto
                textoCasiFinal.removeFromParent()
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionCasiFinalSinObjetos {
                estadoActual = .enJuego
                estadoEnLaAnimacion = .sinAnimacion
                estadoSabio = .quieto
                textoFinalSinObjetos.position = CGPoint(x: 20000, y: 20000)
                
            } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionFinal1 {
                estadoActual = .animacionFinal
                estadoEnLaAnimacion = .animacionFinal2
                textoFinal.removeFromParent()
                animacionObjetosFinal2()
                
            } else if estadoActual == .animacionFinal && estadoEnLaAnimacion == .animacionFinalAcabada {
                let accionParaFinal = SKAction.group([SKAction.run {
                    self.iPad.run(SKAction.fadeOut(withDuration: 2))
                    self.mensajeFinal.run(SKAction.fadeOut(withDuration: 2))
                    self.fondoFinal.run(SKAction.fadeOut(withDuration: 2))
                    }])
                run(SKAction.sequence([SKAction.wait(forDuration: 1.25), accionParaFinal, SKAction.run {
                    self.volverAlMenu()
                    }]))
                
            } else if objeto.contains(botonPause) {
                sabio.removeAllActions()
                panelDePause.position = CGPoint(x: 0, y: 0)
                estadoActual = .pausa
                
            } else if objeto.contains(botonReanudar) {
                panelDePause.position = CGPoint(x: 0, y: 20000)
                estadoActual = .enJuego
                estadoSabio = .quieto
                
            } else if objeto.contains(botonVolverAlMenu) {
                volverAlMenu()
                
            }  else if tile1 == nil && estadoActual == .enJuego && estadoSabio == .quieto {
                estadoEnLaAnimacion = .animacionDelAgua
                estadoDelUpdateAgua = .sinEjecutar
                estadoSabio = .movimiento
                
                flechaDelToque.removeAllActions()
                moverFlechaDelToque()
                
                run(SKAction.sequence([esperar3, SKAction.run {
                    self.estadoSabio = .quieto
                    }]))
                
            } else if estadoActual == .enJuego && (estadoSabio == .quieto || estadoSabio == .quietoAlPrincipio) {
                estadoSabio = .movimiento
                
                accionMoverse = SKAction.move(to: localizacionDelToque, duration: sacarDuracion(localizacionA: posicionSabio, localizacionB: localizacionDelToque, velocidad: 1000))
                print(accionMoverse.duration)
                
                flechaDelToque.removeAllActions()
                moverFlechaDelToque()
                
                animacionSabio()
                sabio.run(accionMoverse, withKey: "movimiento")
                
                run(SKAction.sequence([SKAction.wait(forDuration: accionMoverse.duration), SKAction.run {
                    self.estadoSabio = .quieto
                    self.sabio.removeAllActions()
                    }]), withKey: "contador")
            }
            
        }
    }
    
    
    //
    // Did Begin Contact
    //
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        // Asignacion de Contactos
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        //                      //
        // HYPER IF STATEMENT 2 //
        //                      //
        
        if firstBody.categoryBitMask == sabio.physicsBody?.categoryBitMask && secondBody.categoryBitMask == 1 {
            sabio.removeAllActions()
            self.removeAction(forKey: "contador")
            self.removeAction(forKey: "contadorFlecha")
            
            estadoEnLaAnimacion = .animacionDelAgua
            estadoDelUpdateAgua = .sinEjecutar
            
        } else if secondBody.categoryBitMask == 2 {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte1}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 3 {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte2}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 4 {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte3}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 5 {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte4}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 6 {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte5}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 7 {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte6}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 8 && (plumaTintaConseguida == true && libroConseguido == true && pizarraTizaConseguida == true) {
            sabio.removeAllActions()
            run(SKAction.sequence([SKAction.run {self.sabio.position = self.sitioDeTeletransporte7}, SKAction.wait(forDuration: 0.1), SKAction.run {
                self.estadoSabio = .quieto
                self.estadoActual = .enJuego
                }]))
            run(SKAction.playSoundFileNamed("Sonido Portal.mp3", waitForCompletion: false))
            
        } else if secondBody.categoryBitMask == 8 {
            sabio.removeAllActions()
            estadoActual = .animacion
            animacionFinalSinObjetos()
            
        } else if secondBody.categoryBitMask == 9 {
            sabio.removeAllActions()
            cogerPluma()
            
        } else if secondBody.categoryBitMask == 10 {
            sabio.removeAllActions()
            cogerLibro()
            
        } else if secondBody.categoryBitMask == 11 {
            sabio.removeAllActions()
            cogerPizarra()
            
        } else if secondBody.categoryBitMask == 12 {
            sabio.removeAllActions()
        }
    }
    
    
    //
    // MARK: Update
    //
    
    override func update(_ currentTime: TimeInterval) {
        
        //
        // Animaciones
        //
        
        // Animacion Del Principio
        if estadoActual == .animacion {
            filtroDeAnimaciones.position = sabio.position
            sabioDeAnimaciones.position = CGPoint(x: sabio.position.x - 1180,y: sabio.position.y - 870)
            sabio.removeAllActions()
        } else {
            sabioDeAnimaciones.position = CGPoint(x: 0, y: 20000)
            filtroDeAnimaciones.position = CGPoint(x: 0, y: 20000)
        }
        
        
        // Animaciones De Objeto
        if estadoActual == .animacion && estadoEnLaAnimacion == .animacionPluma {
            textoPluma.position = CGPoint(x: sabio.position.x + 500, y: sabio.position.y + 320)
            
        } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionLibro {
            textoLibro.position = CGPoint(x: sabio.position.x + 500, y: sabio.position.y + 320)
            
        } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacionPizarra {
            textoPizarra.position = CGPoint(x: sabio.position.x + 500, y: sabio.position.y + 320)
            
        }
        
        
        // Quitar Objetos
        if plumaTinta.position == CGPoint(x: sabio.position.x - 1618.7, y: sabio.position.y + 887.5) {
            plumaTinta.removeFromParent()
            
        } else if libro.position == CGPoint(x: sabio.position.x - 1631.2, y: sabio.position.y) {
            libro.removeFromParent()
            
        } else if pizarraTiza.position == CGPoint(x: sabio.position.x - 1643.7, y: sabio.position.y - 887.5) {
            pizarraTiza.removeFromParent()
            
        }
        
        
        // Hierba Amarilla
        if tileSabio?.name == "Hierba Amarilla" && (estadoDelUpdateAnimaciones == .sinEjecutarAlPrincipio || estadoDelUpdateAnimaciones == .sinEjecutar) {
            
            estadoDelUpdateAnimaciones = .ejecutado
            estadoActual = .animacion
            estadoEnLaAnimacion = .animacionHierba
            
            filtroDeAnimaciones.position = sabio.position
            sabioDeAnimaciones.position = CGPoint(x: sabio.position.x - 1180,y: sabio.position.y - 870)
            sabio.removeAllActions()
            textoHierbaAmarilla.position = CGPoint(x: sabio.position.x + 700, y: sabio.position.y + 600)
            
            lago3.removeFromParent()
            
            hierbaTile.name = "Hierba"
            hierbaTile.textures.removeAll(keepingCapacity: true)
            hierbaTile.textures = [SKTexture(imageNamed: "Hierba Centro"), SKTexture(imageNamed: "Hierba Centro")]
            
        } else if tileSabio?.name == "Hierba Amarilla 2" {
            
            sekilin.removeFromParent()
            textoSekilin.removeFromParent()
            
            lago4.removeFromParent()
            
            hierbaTile2.name = "Hierba"
            hierbaTile2.textures.removeAll(keepingCapacity: true)
            hierbaTile2.textures = [SKTexture(imageNamed: "Hierba Centro"), SKTexture(imageNamed: "Hierba Centro")]
        }
        
        
        // Hierba Casi Final
        if tileSabio?.name == "Hierba Final" && (estadoDeAnimacionCasiFinal == .sinEjecutar || estadoDeAnimacionCasiFinal == .sinEjecutarAlPrincipio) && estadoSabio == .quieto {
            estadoActual = .animacion
            animacionFinal()
        }
        
        // Hierba Animacion Final
        if tileSabio?.name == "Hierba Animacion Final" && (estadoDeAnimacionFinal == .sinEjecutar || estadoDeAnimacionFinal == .sinEjecutarAlPrincipio) {
            estadoDeAnimacionFinal = .ejecutado
            animacionObjetosFinal()
        }
        
        posicionSabio = sabio.position
            
        columnaSabio = fondoLaberinto.tileColumnIndex(fromPosition: posicionSabio)
        filaSabio = fondoLaberinto.tileRowIndex(fromPosition: posicionSabio)
        tileSabio = fondoLaberinto.tileDefinition(atColumn: columnaSabio, row: filaSabio)
        
        
        // Animacion Del Agua
        if estadoActual == .enJuego && estadoEnLaAnimacion == .animacionDelAgua && (estadoDelUpdateAgua == .sinEjecutarAlPrincipio || estadoDelUpdateAgua == .sinEjecutar) {
            estadoDelUpdateAgua = .ejecutado
            
            textoDelAgua.position = CGPoint(x: 460, y: 330)
            run(SKAction.sequence([esperar2,SKAction.run {self.estadoSabio = .quieto}, esperar1, SKAction.run {
                self.textoDelAgua.position = CGPoint(x: 20000, y: 20000)
                self.estadoEnLaAnimacion = .sinAnimacion
                }]))
        }
    }
        
    
    //
    //
    // Funciones Varias
    //
    //
    
    func volverAlMenu() {
        musicaDeFondo?.stop()
        
        hierbaTile.name = "Hierba Amarilla"
        hierbaTile.textures.removeAll(keepingCapacity: true)
        hierbaTile.textures = [SKTexture(imageNamed: "Hierba Amarilla"), SKTexture(imageNamed: "Hierba Amarilla")]
        
        hierbaTile2.name = "Hierba Amarilla 2"
        hierbaTile2.textures.removeAll(keepingCapacity: true)
        hierbaTile2.textures = [SKTexture(imageNamed: "Hierba Amarilla 2"), SKTexture(imageNamed: "Hierba Amarilla 2")]
        
        let gameScene2:menu = menu(size: CGSize(width: 2048, height: 1536))
        let transicion = SKTransition.fade(withDuration: 2)
        self.view!.presentScene(gameScene2,transition: transicion)
    }
    
    
    func pasarDeAnimacion1() {
        if estadoActual == .animacion && estadoEnLaAnimacion == .animacion1 {
            texto1.removeFromParent()
            estadoEnLaAnimacion = .animacion2
            
        } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacion2 {
            texto2.removeFromParent()
            estadoEnLaAnimacion = .animacion3
            
        } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacion3 {
            texto3.removeFromParent()
            estadoEnLaAnimacion = .animacion4
            
        } else if estadoActual == .animacion && estadoEnLaAnimacion == .animacion4 {
            texto4.removeFromParent()
            
            estadoActual = .enJuego
            estadoEnLaAnimacion = .sinAnimacion
        }
    }
    
    
    func cogerPluma() {
        estadoActual = .enAnimacion
        
        moverPlumaTinta = SKAction.move(to: CGPoint(x: sabio.position.x - 1618.7, y: sabio.position.y + 887.5), duration: 2)
        cambiarDeTexturaPlumaTinta = SKAction.setTexture(SKTexture(imageNamed: "Pluma y Tinta"))
        cambioSabioAnimacion = SKAction.run {self.estadoActual = .animacion; self.estadoEnLaAnimacion = .animacionPluma}
        
        secuenciaColocarsePlumaTinta = SKAction.sequence([enseñar, moverPlumaTinta, esconder, SKAction.run {self.plumaTintaOpacidad.run(self.cambiarDeTexturaPlumaTinta)}, SKAction.wait(forDuration: 0.5), cambioSabioAnimacion])
        
        rocas1.run(secuenciaReducirDeseparecer)
        plumaTinta.run(secuenciaColocarsePlumaTinta)
        
        plumaTintaConseguida = true
    }
    
    
    func cogerLibro() {
        estadoActual = .enAnimacion
        
        moverLibro = SKAction.move(to: CGPoint(x: sabio.position.x - 1631.2, y: sabio.position.y), duration: 2)
        cambiarDeTexturaLibro = SKAction.setTexture(SKTexture(imageNamed: "Libro"))
        cambioSabioAnimacion = SKAction.run {self.estadoActual = .animacion; self.estadoEnLaAnimacion = .animacionLibro}
        
        secuenciaColocarseLibro = SKAction.sequence([enseñar, moverLibro, esconder, SKAction.run {self.libroOpacidad.run(self.cambiarDeTexturaLibro)}, SKAction.wait(forDuration: 0.5), cambioSabioAnimacion])
        
        rocas2.run(secuenciaReducirDeseparecer)
        libro.run(secuenciaColocarseLibro)
        
        libroConseguido = true
    }
    
    
    func cogerPizarra() {
        estadoActual = .enAnimacion
        
        moverPizarra = SKAction.move(to: CGPoint(x: sabio.position.x - 1643.7, y: sabio.position.y - 887.5), duration: 2)
        cambiarDeTexturaPizarra = SKAction.setTexture(SKTexture(imageNamed: "Pizarra y Tiza"))
        cambioSabioAnimacion = SKAction.run {self.estadoActual = .animacion; self.estadoEnLaAnimacion = .animacionPizarra}
        
        secuenciaColocarsePizarra = SKAction.sequence([enseñar, moverPizarra, esconder, SKAction.run {self.pizarraTizaOpacidad.run(self.cambiarDeTexturaPizarra)}, SKAction.wait(forDuration: 0.5), cambioSabioAnimacion])
        
        rocas3.run(secuenciaReducirDeseparecer)
        pizarraTiza.run(secuenciaColocarsePizarra)
        
        pizarraTizaConseguida = true
    }
    
    
    func animacionFinal() {
        textoCasiFinal.position = CGPoint(x: sabio.position.x + 500, y: sabio.position.y + 320)
        estadoEnLaAnimacion = .animacionCasiFinal
        estadoDeAnimacionCasiFinal = .ejecutado
    }
    
    
    func animacionFinalSinObjetos() {
        textoFinalSinObjetos.position = CGPoint(x: posicionSabio.x + 700, y: posicionSabio.y + 600)
        estadoEnLaAnimacion = .animacionCasiFinalSinObjetos
    }
    
    
    func animacionObjetosFinal() {
        estadoActual = .animacion
        textoFinal.position = CGPoint(x: sabio.position.x + 500, y: sabio.position.y + 320)
        estadoEnLaAnimacion = .animacionFinal1
    }
    
    
    func animacionObjetosFinal2() {
        estadoActual = .animacionFinal
        estadoEnLaAnimacion = .animacionFinal2
        
        let aparicionDeObjetos = SKAction.run {
            self.plumaTintaAnimacion.run(SKAction.resize(toWidth: 299.6, height: 334.6, duration: 1.5))
            self.libroAnimacion.run(SKAction.resize(toWidth: 311.5, height: 221.9, duration: 1.5))
            self.pizarraTizaAnimacion.run(SKAction.resize(toWidth: 368.2, height: 238, duration: 1.5))
        }
        let reduccionDeTodosLosObjetosOpacidad = SKAction.run {
            self.plumaTintaOpacidad.run(self.secuenciaReducirDeseparecer)
            self.libroOpacidad.run(self.secuenciaReducirDeseparecer)
            self.pizarraTizaOpacidad.run(self.secuenciaReducirDeseparecer)
            }
        let reduccionDeTodosLosObjetos = SKAction.run {
            self.plumaTintaAnimacion.run(self.secuenciaReducirDeseparecer)
            self.libroAnimacion.run(self.secuenciaReducirDeseparecer)
            self.pizarraTizaAnimacion.run(self.secuenciaReducirDeseparecer)
            }
        let reduccionDelRobot = SKAction.run {
            self.robotRK378.run(self.secuenciaReducirDeseparecer)
            }
        let animacionIpad = SKAction.sequence([SKAction.run {self.iPad.run(self.accionDeAumentarIpad)}, SKAction.wait(forDuration: 2), SKAction.run {
            self.fondoFinal.run(SKAction.move(to: self.posicionSabio, duration: 1.25))
            self.iPad.run(SKAction.move(to: CGPoint(x: self.posicionSabio.x, y: self.posicionSabio.y + 500), duration: 3))
            }])
        
        let animacionMensajeFinal = SKAction.run {
            self.mensajeFinal.position = CGPoint(x: self.posicionSabio.x, y: self.posicionSabio.y - 500)
            self.mensajeFinal.run(self.accionDeAumentarMensajeFinal)
            }
        
        
        run(SKAction.sequence([reduccionDeTodosLosObjetosOpacidad, SKAction.wait(forDuration: 1.5), aparicionDeObjetos, SKAction.wait(forDuration: 3), reduccionDeTodosLosObjetos, esperar2, esperar1, reduccionDelRobot, esperar1, animacionIpad, esperar1, animacionMensajeFinal, esperar1, esperar1, esperar2, SKAction.run {self.estadoEnLaAnimacion = .animacionFinalAcabada}]))
    }
    
    
    func moverFlechaDelToque() {
        localizacionDelToqueParaFlecha = localizacionDelToque
        flechaDelToque.run(SKAction.sequence([SKAction.run {self.flechaDelToque.position = self.localizacionDelToqueParaFlecha}, SKAction.move(to: CGPoint(x: localizacionDelToqueParaFlecha.x, y: localizacionDelToqueParaFlecha.y + 200), duration: 0.5), SKAction.move(to: CGPoint(x: localizacionDelToqueParaFlecha.x, y: localizacionDelToqueParaFlecha.y), duration: 0.5), SKAction.move(to: CGPoint(x: localizacionDelToqueParaFlecha.x, y: localizacionDelToqueParaFlecha.y + 200), duration: 0.5), SKAction.move(to: CGPoint(x: localizacionDelToqueParaFlecha.x, y: localizacionDelToqueParaFlecha.y), duration: 0.5), SKAction.move(to: CGPoint(x: localizacionDelToqueParaFlecha.x, y: localizacionDelToqueParaFlecha.y + 200), duration: 0.5), SKAction.run {
            self.flechaDelToque.removeAllActions()
            self.flechaDelToque.position = CGPoint(x: 20000, y: 20000)
            }]))
        
        run(SKAction.sequence([SKAction.wait(forDuration: accionMoverse.duration), SKAction.run {
            self.flechaDelToque.removeAllActions()
            self.flechaDelToque.position = CGPoint(x: 20000, y: 20000)
            }]), withKey: "contadorFlecha")
    }
    
    
    func animacionSabio() {
        if localizacionDelToque.x < (posicionSabio.x) {
            sabio.run(SKAction.sequence([animacionMovimiento2!, animacionMovimiento2!, animacionMovimiento2!]), withKey: "animacionSabio2")
            
        } else if localizacionDelToque.x > (posicionSabio.x) {
            sabio.run(SKAction.sequence([animacionMovimiento!, animacionMovimiento!, animacionMovimiento!]), withKey: "animacionSabio")
        }
    }


    func sacarDuracion(localizacionA: CGPoint, localizacionB: CGPoint, velocidad: CGFloat) -> TimeInterval {
        let distanciaX = (localizacionB.x - localizacionA.x)
        let distanciaY = (localizacionB.y - localizacionA.y)
        let distancia = sqrt((distanciaX * distanciaX) + (distanciaY * distanciaY))
        let duracion: TimeInterval = TimeInterval(distancia / velocidad)
    
        return duracion
    }
}

