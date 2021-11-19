//
//  GameScene.swift
//  Mini Game
//
//  Created by Sawyer Cherry on 11/10/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
       
        
        let spawnEnemy = SKAction.run {
            let cars = SKSpriteNode(imageNamed: "copcar")
            cars.size = CGSize(width: 200, height: 200)
            
            let screenHeight = self.size.height
            let screenWidth = self.size.width
            cars.position.x = screenWidth
            cars.position.y = CGFloat.random(in: 0...screenHeight)
            self.addChild(cars)
            
            cars.run(.repeatForever(.rotate(byAngle: .pi * 1, duration: .random(in: 1...4))))
            
            
            
            let leaveScreen = SKAction.moveBy(x: -screenWidth, y: 0, duration: .random(in: 1...6))
            let destroy = SKAction.removeFromParent()
            let sequence = SKAction.sequence([leaveScreen, destroy])
            cars.run(sequence)
        }
        
        let spawnStuff = SKAction.repeatForever(.sequence([spawnEnemy, .wait(forDuration: 1)]))
        self.run(spawnStuff)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
